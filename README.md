# Vintage309

**Vintage309** es una tienda de ropa vintage de segunda mano diseñada para ofrecer moda única, sostenible y asequible. Este proyecto tiene como objetivo promover el consumo responsable mientras se brinda un estilo auténtico a precios accesibles.

---

## 🌐 HOST

🏗️

---

## 🛠️ Tecnologías Utilizadas

- **Back-End:** Node.js con Express.
- **Base de Datos:** MariaDB utilizando el ORM Sequelize.
- **Arquitectura:** Proyecto monolítico.
- **Programador:** EderAJ30.

---

## 🌟 Características Principales

- Catálogo de ropa vintage con descripción detallada, precios y fotografías.
- Sistema de búsqueda y filtrado por categorías, tallas y estilos.
- Carrito de compras con integración para calcular costos y gestionar pedidos.
- Gestión de usuarios: Registro, inicio de sesión y perfil.
- Panel de administración para gestionar inventario, productos y pedidos.

---

## 📂 Estructura del Proyecto

```
Vintage309/
├── controllers/         # Lógica de negocio
├── models/              # Definición de modelos de Sequelize
├── routes/              # Endpoints del API
├── views/               # Plantillas HTML (opcional si se usa motor de vistas)
├── config/              # Configuración de base de datos y entorno
├── public/              # Archivos estáticos (CSS, JS, imágenes)
├── app.js               # Configuración principal del servidor
└── package.json         # Dependencias y scripts
```

---

## 🚀 Configuración e Instalación

### 1. Clonar el Repositorio

```bash
git clone https://github.com/EderAJ30/VINTANGE309.git
cd Vintage309
```

### 2. Instalar Dependencias

```bash
npm install sequelize
```

### 3. Configurar el Entorno

Crear un archivo `.env` en la raíz del proyecto con las siguientes variables:

```
DB_HOST=localhost
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña
DB_NAME=vintage309
DB_PORT=3306
PORT=3000
```

### 4. Configurar la Base de Datos

Asegúrate de tener **MariaDB** instalado y crea la base de datos:

```sql
source esquema.sql;
```

### 5. Ejecutar el Proyecto

```bash
npm start
```

El servidor estará disponible en: [http://localhost:2800](http://localhost:2800)

---

## 📖 API Endpoints

### Rutas de Productos

- **GET** `/products` - Lista todos los productos.
- **GET** `/products/:id` - Muestra un producto por ID.
- **POST** `/products` - Agrega un nuevo producto (solo admin).
- **PUT** `/products/:id` - Actualiza un producto por ID (solo admin).
- **DELETE** `/products/:id` - Elimina un producto por ID (solo admin).

### Rutas de Usuarios

- **POST** `/register` - Registro de usuario.
- **POST** `/login` - Inicio de sesión.
- **GET** `/profile` - Perfil del usuario autenticado.

### Rutas de Carrito

- **GET** `/cart` - Muestra el carrito del usuario.
- **POST** `/cart/add` - Agrega un producto al carrito.
- **DELETE** `/cart/remove/:id` - Elimina un producto del carrito.

---

## 📝 Licencia

Este proyecto está licenciado bajo la [MIT License](./LICENSE).

---

## 💌 Contacto

Desarrollado por **EderAJ30**. Si tienes preguntas o sugerencias, puedes contactarme a través de mi [GitHub](https://github.com/EderAJ30).
