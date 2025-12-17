# Bullet Physics

Bullet Physics es un motor de física 3D de código abierto extremadamente popular, escrito en C++ y licenciado bajo zlib, ideal para juegos, simulaciones y VFX. Desarrollado por Erwin Coumans (ex-Sony, AMD, Google), ha ganado un premio de la Academia por su contribución técnica.[wikipedia](https://es.wikipedia.org/wiki/Bullet_(software))

## Características principales

- **Detección de colisiones**: Discreta y continua (CCD), con formas primitivas (esfera, caja, cápsula, cono, cilindro) y complejas (convex hull GJK, mallas no convexas, triangulares).
- **Dinámica avanzada**: Cuerpos rígidos, blandos (tela, cuerda, deformables), vehículos, personajes, restricciones (bisagra, slider, 6DOF) y fluidos.
- **Optimizaciones**: Soporte para PS3 Cell SPU, CUDA, OpenCL; broadphase múltiple (Dbvt, Axis3Sweep); arquitectura modular para usar solo componentes necesarios.[isaaclacoba.github+1](http://isaaclacoba.github.io/tinman/posts/introduccion-bullet/introduccion-a-bullet-physics.html)

## Plataformas y integraciones

Multiplataforma (Windows, Linux, macOS, Android, iOS, consolas). Integrado en Blender, Godot, Houdini, Cinema 4D, libGDX, Unity (vía plugins), y soporta COLLADA. Incluye PyBullet para Python.[libgdx+1](https://libgdx.com/wiki/extensions/physics/bullet/bullet-physics)

## Uso en la industria

Empleada en películas (efectos visuales), juegos AAA y simulaciones robóticas. Su pipeline `btDiscreteDynamicsWorld::stepSimulation()` maneja gravedad, colisiones y restricciones en un flujo optimizado. Ejemplo básico: mundo → broadphase → dispatcher → solver → integración.[isaaclacoba.github](http://isaaclacoba.github.io/tinman/posts/introduccion-bullet/introduccion-a-bullet-physics.html)

## Comparación rápida

| Motor          | Licencia    | GPU Accel   | Facilidad Linux                                              |
| -------------- | ----------- | ----------- | ------------------------------------------------------------ |
| **Bullet**     | zlib (open) | CUDA/OpenCL | Nativo [wikipedia](https://es.wikipedia.org/wiki/Bullet_(software)) |
| ReactPhysics3D | Zlib        | No          | Nativo [github](https://github.com/DanielChappuis/reactphysics3d) |
| PhysX          | Propietario | CUDA NVIDIA | Wine solo [wikipedia](https://es.wikipedia.org/wiki/PhysX)   |

Repositorio oficial: github.com/bulletphysics/bullet3. Perfecto para proyectos Linux sin dependencias propietarias.

1. https://es.wikipedia.org/wiki/Bullet_(software)
2. http://isaaclacoba.github.io/tinman/posts/introduccion-bullet/introduccion-a-bullet-physics.html
3. https://www.youtube.com/watch?v=A298KQbOOEQ
4. https://www.variablenotfound.com/2008/09/bullet-physics-motor-de-fsica-para-c-y.html
5. https://keckcaves.org/es/software/pybullet/
6. https://www.reddit.com/r/gamedev/comments/sc1z56/newton_dynamics_vs_bullet_physics_for_game_engine/
7. https://libgdx.com/wiki/extensions/physics/bullet/bullet-physics
8. https://digitalopus.ca/site/bullet-physics-in-unity-3d/
9. https://www.flyriver.com/s/bullet-physics
10. https://cuppajoeman.github.io/bullet-physics-manual/
11. https://github.com/DanielChappuis/reactphysics3d
12. https://es.wikipedia.org/wiki/PhysX

# Instalación de Bullet Physics en Linux

Bullet Physics se instala fácilmente en Linux vía paquetes o compilación desde fuente. Es nativo y multiplataforma.[wikipedia](https://es.wikipedia.org/wiki/Bullet_(software))

## Método 1: Paquete oficial (Recomendado - Ubuntu/Debian)

```
bashsudo apt update
sudo apt install libbullet-dev bullet-dev-tools libbulletml-dev
```

**Verificación**:

```
bashpkg-config --modversion bullet
# Debería mostrar versión (ej: 3.25)
```

## Método 2: Compilación desde fuente (Última versión)

```
bash# Dependencias
sudo apt install git cmake build-essential libx11-dev libxi-dev libxrandr-dev libgl1-mesa-dev libglfw3-dev

# Clonar y compilar
git clone https://github.com/bulletphysics/bullet3.git
cd bullet3
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_BULLET2_DEMOS=ON -DBUILD_EXTRAS=ON
make -j$(nproc)
sudo make install
```

## Uso en CMake project

```
text# CMakeLists.txt
find_package(Bullet REQUIRED)
target_link_libraries(tu_proyecto 
    ${BULLET_LIBRARIES} 
    BulletDynamics BulletCollision LinearMath
)
```

## Ejemplo básico C++

```
cpp#include <btBulletDynamicsCommon.h>

int main() {
    btDiscreteDynamicsWorld* dynamicsWorld = new btDiscreteDynamicsWorld(...);
    dynamicsWorld->stepSimulation(1/60.f, 10);
    delete dynamicsWorld;
    return 0;
}
```

## Verificación con demos

```
bashcd bullet3/build
./bin/App_ExampleBrowser  # Lanza demos interactivas
```

**Notas**: Paquetes incluyen headers en `/usr/include/bullet/` y libs en `/usr/lib/x86_64-linux-gnu/`. Perfecto para desarrollo inmediato sin compilación.[isaaclacoba.github+1](http://isaaclacoba.github.io/tinman/posts/introduccion-bullet/introduccion-a-bullet-physics.html)

1. https://es.wikipedia.org/wiki/Bullet_(software)
2. http://isaaclacoba.github.io/tinman/posts/introduccion-bullet/introduccion-a-bullet-physics.html