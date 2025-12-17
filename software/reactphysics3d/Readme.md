# ReactPhysics3D

ReactPhysics3D es un motor de física 3D de código abierto escrito en C++, diseñado para simulaciones y juegos. Desarrollado por Daniel Chappuis, se libera bajo licencia ZLib y no depende de librerías externas como STL.[reactphysics3d+1](https://www.reactphysics3d.com/)

## Características principales

- **Dinámica de cuerpos rígidos** con detección de colisiones discreta (broadphase AABB dinámico, narrowphase SAT/GJK).
- **Formas de colisión**: Esfera, caja, cápsula, malla convexa, malla cóncava estática, campo de alturas.
- **Múltiples formas por cuerpo**, respuesta de colisiones, fricción (solver Sequential Impulses) y articulaciones (bola-socket, bisagra, deslizante, fijas).
- **Funciones avanzadas**: Filtrado de colisiones por categorías, ray casting, técnica de sueño para cuerpos inactivos, profiler integrado y renderizador de depuración.[reactphysics3d+1](https://www.reactphysics3d.com/documentation/)

## Uso típico

Crea un `PhysicsWorld`, añade cuerpos rígidos (`RigidBody`) con colisionadores y actualiza la simulación cada frame con `PhysicsWorld::update()`. Soporta cuerpos estáticos, cinemáticos y dinámicos, aplicando fuerzas/torques para movimiento realista. Es multiplataforma (Windows, Linux, macOS).[reactphysics3d](https://www.reactphysics3d.com/documentation/)

## Recursos

- Repositorio: GitHub de DanielChappuis/reactphysics3d.
- Documentación completa con manual de usuario y API Doxygen.
- Incluye testbed con demos y pruebas unitarias. Ideal para juegos 3D o simulaciones precisas sin overhead.[github+1](https://github.com/DanielChappuis/reactphysics3d/blob/master/README.md)

1. [https://www.reactphysics3d.com](https://www.reactphysics3d.com/)
2. https://www.reactphysics3d.com/documentation/
3. http://filemegahab3.cyou/exploring-reactphysics3d-a-comprehensive-guide-for-developers/
4. https://github.com/DanielChappuis/reactphysics3d/blob/master/README.md
5. https://github.com/DanielChappuis/reactphysics3d
6. https://pybullet.org/Bullet/phpBB3/viewtopic.php?t=10462
7. https://wiki.gideros.rocks/index.php/ReactPhysics3D
8. https://openhub.net/p/reactphysics3d
9. https://www.freshports.org/graphics/reactphysics3d/
10. https://blog.soyhenry.com/entendiendo-react-fundamentos-y-ventajas-de-este-popular-framework-front-end/

# Instalación en Linux

Para instalar ReactPhysics3D en Linux (Ubuntu/Debian), sigue estos pasos desde el repositorio oficial de GitHub.[github+1](https://github.com/DanielChappuis/reactphysics3d/blob/master/README.md)

## Instalación paso a paso

1. **Instala dependencias**:

   ```
   bashsudo apt update
   sudo apt install git cmake build-essential libglfw3-dev libgl1-mesa-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev
   ```

2. **Clona el repositorio**:

   ```
   bashgit clone https://github.com/DanielChappuis/reactphysics3d.git
   cd reactphysics3d
   ```

3. **Compila con CMake**:

   ```
   bashmkdir build
   cd build
   cmake .. -DCMAKE_BUILD_TYPE=Release
   make -j$(nproc)
   sudo make install
   ```

## Verificación

- Los archivos se instalan en `/usr/local/lib/` y `/usr/local/include/reactphysics3d/`.
- Compila el testbed para probar: `make testbed` en la carpeta build.[github](https://github.com/DanielChappuis/reactphysics3d/blob/master/README.md)

## Uso en tu proyecto

```
cpp// En tu CMakeLists.txt
find_package(ReactPhysics3D REQUIRED)
target_link_libraries(tu_proyecto ReactPhysics3D::ReactPhysics3D)
```

## Notas importantes

- **No requiere dependencias externas** (usa su propia implementación de contenedores).
- Para **desarrollo estático**: `-DBUILD_STATIC_LIBS=ON` en CMake.
- **Ejemplos incluidos** en `testbed/` para aprender su API.[github+1](https://github.com/DanielChappuis/reactphysics3d)

1. https://github.com/DanielChappuis/reactphysics3d/blob/master/README.md
2. https://github.com/DanielChappuis/reactphysics3d
3. https://www.reactphysics3d.com/documentation/

