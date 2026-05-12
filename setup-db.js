const mysql = require('mysql2/promise');

async function setupDatabase() {
  try {
    // Połącz się bez specyfikacji bazy
    const connection = await mysql.createConnection({
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: ''
    });

    console.log('✓ Połączono z MySQL');

    // Utwórz bazę danych
    await connection.query('CREATE DATABASE IF NOT EXISTS voltix');
    console.log('✓ Baza danych voltix utworzona');

    // Zmień na bazę voltix
    await connection.changeUser({ database: 'voltix' });

    // Utwórz tabelę users
    await connection.query(`
      CREATE TABLE IF NOT EXISTS users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(255) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        name VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    console.log('✓ Tabela users utworzona');

    // Utwórz tabelę components
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
    console.log('✓ Tabela components utworzona');

    // Utwórz tabelę orders (zamówienia)
    await connection.query(`
      CREATE TABLE IF NOT EXISTS orders (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT NOT NULL,
        total_price DECIMAL(10,2) NOT NULL,
        status VARCHAR(50) DEFAULT 'completed',
        card_last_four VARCHAR(4),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    `);
    console.log('✓ Tabela orders utworzona');

    // Utwórz tabelę order_items (szczegóły produktów w zamówieniu)
    await connection.query(`
      CREATE TABLE IF NOT EXISTS order_items (
        id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT NOT NULL,
        product_id INT,
        product_name VARCHAR(255) NOT NULL,
        product_price DECIMAL(10,2) NOT NULL,
        quantity INT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(id)
      )
    `);
    console.log('✓ Tabela order_items utworzona');

    console.log('\n✓ Baza danych jest gotowa! Możesz teraz uruchomić: npm run api');
    await connection.end();
  } catch (error) {
    console.error('✗ Błąd:', error.message);
    process.exit(1);
  }
}

setupDatabase();
