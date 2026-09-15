# PrePoMax

PrePoMax es un pre y postprocesador de elementos finitos para CalculiX. Permite importar geometrías, crear mallas, definir materiales, contactos, cargas y condiciones de contorno, lanzar el solver y visualizar resultados desde una interfaz gráfica.

## Áreas de aplicación

PrePoMax es adecuado para problemas estructurales en los que CalculiX sea el solver principal:

- análisis estático lineal y no lineal;
- grandes deformaciones y plasticidad;
- contacto y fricción;
- análisis modal, térmico y termo-mecánico;
- problemas de tensión plana, deformación plana y sólidos 3D;
- piezas mecánicas, uniones, soportes, recipientes y componentes de máquinas;
- prototipos académicos de resistencia de materiales.

La herramienta facilita el pre y postprocesamiento, pero no sustituye la validación del modelo: la calidad de la malla, las propiedades del material, las restricciones y las cargas siguen siendo responsabilidad del usuario.

## Plataforma y requisitos

La distribución oficial de PrePoMax está orientada a **Windows** y requiere .NET Framework 4.8. Normalmente se distribuye como una aplicación portable junto con CalculiX o con la posibilidad de seleccionar el ejecutable del solver.

En Linux no hay una instalación nativa oficialmente soportada equivalente a la de Windows. Las alternativas prácticas son:

1. ejecutar la versión de Windows mediante **Wine**;
2. usar una máquina virtual o un equipo Windows;
3. ejecutar CalculiX y otras herramientas Linux por separado, editando archivos `.inp` y visualizando resultados con herramientas compatibles.

Para obtener la versión oficial, consultar la [página de descargas de PrePoMax](https://prepomax.fs.um.si/downloads/). Conviene registrar la versión de PrePoMax, CalculiX y Wine utilizada en cada estudio.

## Instalación y configuración en Linux con Wine

Los siguientes pasos son una ruta de prueba para Ubuntu o Debian. No reemplazan el soporte oficial de Windows.

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wine64 wine32 winetricks
```

Crear un prefijo aislado de 64 bits e instalar .NET Framework si la versión de PrePoMax lo requiere:

```bash
export WINEPREFIX="$HOME/.wine-prepomax"
export WINEARCH=win64
wineboot -u
winetricks -q dotnet48
```

Después de descargar y descomprimir PrePoMax, iniciar el ejecutable con:

```bash
wine /ruta/a/PrePoMax/PrePoMax.exe
```

En la configuración de PrePoMax, comprobar que el ejecutable de CalculiX esté seleccionado y que el directorio de trabajo tenga permisos de escritura. Si la interfaz o .NET falla bajo Wine, la alternativa más fiable es una máquina virtual Windows.

## Prueba posterior a la instalación

La prueba mínima debe confirmar tres cosas: la interfaz abre, CalculiX puede ejecutarse y PrePoMax puede leer resultados.

1. Abrir PrePoMax y crear un modelo nuevo.
2. Crear un cubo o una viga sencilla.
3. Generar una malla gruesa.
4. Asignar un material elástico con unidades coherentes.
5. Fijar una cara y aplicar una carga pequeña en la cara opuesta.
6. Crear un análisis estático y ejecutar CalculiX.
7. Visualizar desplazamiento y tensión de von Mises.
8. Guardar el proyecto y comprobar que se generan el archivo de entrada y los resultados `.frd`.

Resultado esperado: el solver termina sin error, el desplazamiento no es nulo y el postprocesador muestra campos de resultados. Antes de usar un modelo real, comparar la viga o el cubo con una solución analítica sencilla.

## Casos de uso para implementar

### Freno de disco termo-mecánico

Este es el caso relacionado con [termomecánica](../../termomechanics/Readme.md). El flujo puede incluir geometría STEP, contacto disco-pastilla, fricción, generación de calor, convección y deformación térmica. Deben registrarse propiedades dependientes de la temperatura, pasos de tiempo y balance de energía.

### Soporte mecánico con convergencia de malla

Modelar un soporte con un agujero, comparar tres tamaños de elemento y observar desplazamiento y tensión máxima. El caso debe documentar concentraciones de tensión y evitar interpretar una singularidad geométrica como una tensión física convergente.

### Contacto entre piezas

Construir dos bloques con contacto y fricción, aplicar una carga normal y una tangencial y estudiar la presión de contacto y el deslizamiento. Es un buen caso para verificar superficies, normales, coeficiente de fricción y convergencia no lineal.

### Análisis modal de una viga

Comparar las primeras frecuencias calculadas con la solución de una viga idealizada. El resultado debe incluir masa, restricciones, densidad y una tabla de frecuencias para varias mallas.

## Limitaciones y buenas prácticas

- Confirmar siempre que el análisis elegido y sus opciones están realmente expuestos por la versión instalada.
- Usar unidades coherentes: CalculiX no corrige automáticamente un sistema de unidades inconsistente.
- Refinar la malla en contactos, agujeros y cambios bruscos de geometría.
- Reportar condiciones de contorno, propiedades, solver, malla y criterios de convergencia.
- Editar el `.inp` solo cuando sea necesario y conservarlo junto con el proyecto para hacer el estudio auditable.

## Referencias

- [PrePoMax](https://prepomax.fs.um.si/)
- [CalculiX](https://www.calculix.de/)
- [Descargas de PrePoMax](https://prepomax.fs.um.si/downloads/)