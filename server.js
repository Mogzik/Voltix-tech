const Database = require('better-sqlite3');
const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3001;

app.use(cors());

// Path to the JSON file
const jsonFilePath = path.join(__dirname, 'src', 'data', 'components.json');

// Read and parse the JSON data
const data = JSON.parse(fs.readFileSync(jsonFilePath, 'utf8'));
const components = data.components;

// Create or open the database
const db = new Database('components.db');

// Drop and recreate table to update data
db.exec('DROP TABLE IF EXISTS components');

// Create the table
db.exec(`
  CREATE TABLE components (
    id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL,
    brand TEXT,
    category TEXT,
    image TEXT,
    specs TEXT
  )
`);

// Prepare the insert statement
const insert = db.prepare(`
  INSERT OR REPLACE INTO components (id, name, price, brand, category, image, specs)
  VALUES (?, ?, ?, ?, ?, ?, ?)
`);

// Insert the data
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

components.forEach(component => {
  const image = imageMap[component.name] || component.image;
  insert.run(
    component.id,
    component.name,
    component.price,
    component.brand,
    component.category,
    image,
    JSON.stringify(component.specs)
  );
});

// API endpoint
app.get('/components', (req, res) => {
  const rows = db.prepare('SELECT * FROM components').all();
  // Parse specs back to JSON
  const result = rows.map(row => ({
    ...row,
    specs: JSON.parse(row.specs)
  }));
  res.json(result);
});

app.get('/', (req, res) => {
  const rows = db.prepare('SELECT * FROM components').all();
  // Parse specs back to JSON
  const result = rows.map(row => ({
    ...row,
    specs: JSON.parse(row.specs)
  }));
  res.json({ components: result });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});