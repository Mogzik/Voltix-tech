const mysql = require('mysql2/promise');
const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3001;

app.use(cors());

// MySQL connection settings (use env vars if available)
const DB_HOST = process.env.DB_HOST || 'localhost';
const DB_PORT = process.env.DB_PORT || 3306;
const DB_USER = process.env.DB_USER || 'root';
const DB_PASSWORD = process.env.DB_PASSWORD || '';
const DB_NAME = process.env.DB_NAME || 'voltix';

// Path to the JSON file
const jsonFilePath = path.join(__dirname, 'src', 'data', 'components.json');

// Read and parse the JSON data
const data = JSON.parse(fs.readFileSync(jsonFilePath, 'utf8'));
const components = data.components;

const imageMap = {
  "Intel Core i9-13900K": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/9/pr_2022_9_27_12_7_43_224_02.jpg",
  "AMD Ryzen 9 7950X": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_25_12_54_39_334_03.jpg",
  "NVIDIA RTX 4090": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/4/pr_2024_4_4_9_40_44_408_00.jpg",
  "Samsung 32GB DDR5 RAM": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_22_9_24_53_830_00.jpg",
  "ASUS ROG Strix Z690-E": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_29_15_4_12_850_04.jpg",
  "Samsung Odyssey G9 Monitor": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2025/2/pr_2025_2_13_14_7_27_467_00.jpg",
  "Logitech MX Master 3S": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/6/pr_2022_6_15_10_51_26_297_00.jpg",
  "Razer BlackWidow V3": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2020/10/pr_2020_10_15_14_39_37_615_00.jpg",
  "Apple iPhone 15 Pro": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_12_22_21_55_906_00.jpg",
  "Sony PlayStation 5": "https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/11/pr_2023_11_23_11_12_58_599_00.jpg"
};

let db;

async function initializeDatabase() {
  const connection = await mysql.createConnection({
    host: DB_HOST,
    port: DB_PORT,
    user: DB_USER,
    password: DB_PASSWORD,
    multipleStatements: true
  });

  await connection.query(`CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\``);
  await connection.changeUser({ database: DB_NAME });

  let existingCount = 0;
  try {
    const [countRows] = await connection.query('SELECT COUNT(*) AS count FROM components');
    existingCount = countRows[0]?.count || 0;
  } catch (error) {
    existingCount = 0;
  }

  if (existingCount < 100) {
    const sqlPath = path.join(__dirname, 'components.sql');
    if (fs.existsSync(sqlPath)) {
      if (existingCount > 0) {
        await connection.query('DROP TABLE IF EXISTS components');
      }
      const sqlDump = fs.readFileSync(sqlPath, 'utf8');
      const cleanSql = sqlDump
        .replace(/\/\*![\s\S]*?\*\/?;?/g, '')
        .replace(/--.*$/gm, '')
        .replace(/^\s*;\s*$/gm, '')
        .trim();
      await connection.query(cleanSql);
    } else {
      await connection.query(`
        CREATE TABLE IF NOT EXISTS components (
          id INT PRIMARY KEY,
          name VARCHAR(255),
          price DECIMAL(10,2),
          brand VARCHAR(100),
          category VARCHAR(100),
          image TEXT,
          specs TEXT
        )
      `);

      const insertSql = `
        INSERT INTO components (id, name, price, brand, category, image, specs)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
          name = VALUES(name),
          price = VALUES(price),
          brand = VALUES(brand),
          category = VALUES(category),
          image = VALUES(image),
          specs = VALUES(specs)
      `;

      for (const component of components) {
        const image = imageMap[component.name] || component.image;
        await connection.execute(insertSql, [
          component.id,
          component.name,
          component.price,
          component.brand,
          component.category,
          image,
          JSON.stringify(component.specs)
        ]);
      }
    }
  }

  return connection;
}

function getFallbackImage(category, name) {
  const lower = category?.toLowerCase() || '';
  let query = 'computer';
  if (lower.includes('podzespo')) query = 'computer hardware';
  else if (lower.includes('monitory')) query = 'monitor';
  else if (lower.includes('akcesoria')) query = 'gaming accessories';
  else if (lower.includes('smartfony')) query = 'smartphone';
  else if (lower.includes('konsolki')) query = 'gaming console';
  else if (name?.toLowerCase().includes('iphone')) query = 'smartphone';
  else if (name?.toLowerCase().includes('playstation')) query = 'gaming console';
  return `https://source.unsplash.com/400x300/?${encodeURIComponent(query)}`;
}

function getImageUrl(image, category, name) {
  if (!image || typeof image !== 'string') return getFallbackImage(category, name);
  const lowerImage = image.toLowerCase();
  if (lowerImage.includes('placeholder') || lowerImage.includes('googleusercontent') || lowerImage.includes('gstatic') || lowerImage.includes('encrypted') || lowerImage.includes('blob:') || lowerImage.includes('data:') || lowerImage.includes('no+image') || lowerImage.includes('no-image')) {
    return getFallbackImage(category, name);
  }
  return image;
}

function safeParseSpecs(specs) {
  try {
    return JSON.parse(specs);
  } catch (error) {
    console.warn('Failed to parse specs JSON:', error.message);
    return specs;
  }
}

app.get('/components', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM components');
    const result = rows.map(row => ({
      ...row,
      image: getImageUrl(row.image, row.category, row.name),
      specs: safeParseSpecs(row.specs)
    }));
    res.json(result);
  } catch (error) {
    console.error('MySQL query error:', error);
    res.status(500).json({ error: 'Database error' });
  }
});

app.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM components');
    const result = rows.map(row => ({
      ...row,
      image: getImageUrl(row.image, row.category, row.name),
      specs: safeParseSpecs(row.specs)
    }));
    res.json({ components: result });
  } catch (error) {
    console.error('MySQL query error:', error);
    res.status(500).json({ error: 'Database error' });
  }
});

initializeDatabase()
  .then(connection => {
    db = connection;
    app.listen(port, () => {
      console.log(`Server running on http://localhost:${port}`);
      console.log(`Using MySQL database ${DB_NAME} at ${DB_HOST}:${DB_PORT}`);
    });
  })
  .catch(error => {
    console.error('Failed to initialize database:', error);
    process.exit(1);
  });