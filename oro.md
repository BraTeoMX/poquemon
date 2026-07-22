# ORO.MD — FUENTE DE VERDAD DEL PROYECTO

> **INSTRUCCIÓN CRÍTICA PARA EL ASISTENTE IA:**
> Este archivo es la **fuente única de verdad** para este proyecto Laravel (`pokemon`). Antes de planificar, sugerir o escribir cualquier código en respuestas a prompts futuros, **DEBES** leer este archivo y ajustar tus propuestas, sintaxis, dependencias e implementaciones estrictamente a lo aquí especificado.

---

## 1. Stack y Versiones Exactas

### Entorno de Ejecución
- **PHP**: `8.2.29` (ejecutándose bajo entorno Laragon `php-8.2.29-Win32-vs16-x64`)
- **Laravel Framework**: `12.64.0`
- **Node.js**: `v24.11.1`
- **NPM**: `11.6.2`
- **Motor de Base de Datos**: SQLite (Versión `3.45.1` / PDO Server Version `8.4.3`)

### Dependencias Composer (`composer.json` / `composer.lock`)
- `laravel/framework`: `v12.64.0`
- `inertiajs/inertia-laravel`: `v2.0.24`
- `laravel/sanctum`: `v4.3.3`
- `laravel/tinker`: `v2.11.1`
- `tightenco/ziggy`: `v2.6.3`
- `laravel/breeze`: `v2.4.2` (dev)
- `laravel-lang/common`: `6.8.0` (dev)
- `laravel-lang/lang`: `15.32.0` (dev)
- `laravel-lang/publisher`: `16.8.0` (dev)
- `laravel/pail`: `v1.2.7` (dev)
- `laravel/pint`: `v1.29.3` (dev)
- `laravel/sail`: `v1.64.0` (dev)
- `fakerphp/faker`: `v1.24.1` (dev)
- `mockery/mockery`: `1.6.12` (dev)
- `nunomaduro/collision`: `v8.9.5` (dev)
- `phpunit/phpunit`: `11.5.56` (dev)

### Dependencias Frontend (`package.json` / `package-lock.json`)
- `sweetalert2`: `11.26.25`
- `vue`: `3.5.40`
- `@inertiajs/vue3`: `2.3.27`
- `vite`: `7.3.6`
- `tailwindcss`: `3.4.19`
- `@tailwindcss/vite`: `4.3.3`
- `@tailwindcss/forms`: `0.5.11`
- `@vitejs/plugin-vue`: `6.0.8`
- `autoprefixer`: `10.5.4`
- `axios`: `1.18.1`
- `concurrently`: `9.2.4`
- `laravel-vite-plugin`: `2.1.0`
- `postcss`: `8.5.22`

---

## 2. Reglas de Compatibilidad

1. **Restricción de Sintaxis y Features**:
   - Todo código PHP debe ser estrictamente compatible con **PHP 8.2.29** y **Laravel 12.64.0**.
   - Todo código Frontend debe usar la sintaxis de **Vue 3.5+ (Composition API / `<script setup>`)** e **Inertia.js v2**.
   - No usar sintaxis o funciones de versiones de PHP más recientes (ej. PHP 8.3/8.4) ni sintaxis obsoleta de Laravel previa a v12.
2. **Evaluación Previa de Librerías / Paquetes**:
   - Antes de sugerir o ejecutar la instalación de cualquier librería nueva en Composer o NPM, se debe verificar expresamente su compatibilidad con **PHP 8.2** y **Laravel 12**.
   - Si la versión solicitada o deseada no es compatible, se debe proponer una versión compatible en Packagist/NPM o una alternativa viable explicando la razón técnica.
   - **Prohibición**: Queda prohibido instalar o sugerir paquetes sin haber confirmado previamente su matriz de compatibilidad.

---

## 3. Cuándo Preguntar en Vez de Asumir

1. **Múltiples Enfoques Válidos**:
   - Si existen diversas opciones de arquitectura o librerías para resolver un problema (ej. utilizar componentes custom de Vue vs una librería UI externa, o decidir entre diferentes patrones de manejo de estado), se deben presentar brevemente las opciones al usuario antes de implementar.
2. **Ambigüedad o Faltantes de Requerimientos**:
   - Si una instrucción carece de especificaciones clave (ej. tipo de exportación, estructura de datos, o reglas de negocio específicas), se debe solicitar aclaración previa en lugar de asumir arbitrariamente.

---

## 4. Convenciones del Proyecto

- **Idioma por Defecto y Regionalización**:
  - `locale`: `es_MX` (Español México).
  - `fallback_locale`: `es` (Español Latinoamericano).
  - `timezone`: `America/Mexico_City`.
- **Base de Datos**:
  - Tablas y columnas deben seguir la convención `snake_case` (nombres descriptivos en español o inglés según se establezca en el dominio de cada módulo).
- **Estructura Frontend**:
  - Componentes de página organizados en `resources/js/Pages/` siguiendo la convención de Inertia.js con Vue 3 (`<script setup>`).
- **Rutas**:
  - Uso de helpers de Ziggy (`route('nombre.ruta')`) en la capa de Vue.

---

## 5. Contexto Funcional del Proyecto

- **Propósito**: Proyecto base Laravel (`pokemon`) configurado con la plantilla starter Vue + Inertia.js y sistema de autenticación Breeze.
- **Fase Actual**: Fase inicial (Setup base del proyecto, entorno de autenticación e internacionalización instalados y configurados).
- **Módulos / Roadmap**: Por definir según los requerimientos que se vayan agregando.

---

## 6. Protocolo de Actualización de este Archivo

**Regla de Actualización Obligatoria**:
> *Cada vez que se instale una librería nueva, se actualice una versión existente, o cambie una convención del proyecto, `oro.md` debe actualizarse en la misma tarea, agregando el cambio a la sección correspondiente.*

### Historial de Cambios

| Fecha | Versión / Librería / Cambio | Descripción |
| :--- | :--- | :--- |
| **2026-07-22** | Creación inicial de `oro.md` | Registro inicial del stack exacto: PHP 8.2.29, Laravel 12.64.0, Vue 3.5.40, Inertia.js 2.3.27, Breeze 2.4.2, `es_MX` / `America/Mexico_City`. |
| **2026-07-22** | Creación de Módulo Pokémon | Creación de migración/modelo `PokemonSearchLog`, `PokemonController`, componente Vue `resources/js/Pages/Pokemon/Index.vue` y rutas `pokemon.index` / `pokemon.search`. |
| **2026-07-22** | Vistas Blade para Pokémon | Creación de `resources/views/layouts/app.blade.php` y `resources/views/pokemon/index.blade.php` con clases compatibles para Tailwind CSS v4. |
| **2026-07-22** | Corrección de Vite en Blade | Ajuste de `@vite(['resources/js/app.js'])` en `app.blade.php` para resolver manifest de CSS importado en JS. |
| **2026-07-22** | Instalación de SweetAlert2 | Instalación de `sweetalert2@11.26.25` vía NPM y configuración de alertas para Éxito, Advertencia y Error. |
| **2026-07-22** | Control Global de Excepciones HTTP | Manejo en `bootstrap/app.php` para excepciones de red (`ConnectionException`, `RequestException`) hacia mensajes controlados en SweetAlert2 evitando Error 500 al usuario. |
| **2026-07-22** | Menú de Navegación del Sistema | Integración de la ruta `Buscador Pokémon` (`pokemon.index`) en la barra de navegación principal y responsiva de `AuthenticatedLayout.vue`. |
| **2026-07-22** | Redirección por Defecto a Pokémon | Redirección de la ruta `/dashboard` hacia `/pokemon` (`pokemon.index`) al autenticarse y descarte de la vista Dashboard por defecto. |
| **2026-07-22** | Redirección a Login por Defecto | Reemplazo de vista de bienvenida y configuración de `Route::fallback` para redirigir a `/login` si no está autenticado o la ruta no existe. |
| **2026-07-22** | Separación Estricta de Rutas (Blade vs Vue) | `/pokemon` sirve **exclusivamente la vista Blade** (`pokemon.index`). Se creó la ruta independiente `/pokemon_vue` (`pokemon.vue`) que ejecuta `indexVue()` para renderizar la vista de Inertia/Vue. |
