# My_I3_Customization
My I3 bare minimum customization to get it working just like I need

## CheatSheet (in Spanish)

> MOD --> Alt

### Ventanas

|            Atajo           | Función                                                                              |
|:--------------------------:|--------------------------------------------------------------------------------------|
|     **`MOD + [hjkl]`**     | Seleccionar la ventana de la izquierda, abajo, arriba o derecha                      |
| **`MOD + Shift + [hjkl]`** | Mover la ventana a la izquierda, abajo, arriba o derecha                             |
|        **`MOD + r`**       | Cambia el tamaño de las ventanas. Se puede usar [hjkl] para mover                    |
|        **`MOD + f`**       | Convierte la ventana en *fullscreen*. Presione de vuelta para volver a la normalidad |
|        **`MOD + v`**       | Indica que la próxima ventana se creará verticalmente                                |
|    **`MOD + Shift + v`**   | Especifica que se crea una ventana de manera horizontal                              |
|        **`MOD + s`**       | *Stack* (apila) toda las ventanas                                                    |
|        **`MOD + w`**       | Convierte las ventanas en *Tabs*                                                     |
|        **`MOD + e`**       | Vuelve al modo *Tiling*                                                              |
| **`Mod+ Shift + Espacio`** | Convierte una ventana tiling en flotante y viceversa                                 |
| **`Mod+ Espacio`** | Selecciona una ventana flotante, y si se presiona de vuelta, vuelve al modo tailing                                 |

### Espacios de Trabajo

|                Atajo                | Función                                                      |
|:-----------------------------------:|--------------------------------------------------------------|
|     **`MOD + [01234567890]`**     | Va al espacio de trabajo seleccionado                        |
| **`MOD + Shift + [01234567890]`** | Mueve la ventana seleccionada al espacio de trabajo indicado |

### Layout

|     Atajo     | Función                                      |
|:-------------:|----------------------------------------------|
| **`MOD + e`** | Modo layout: Tiling                          |
| **`MOD + s`** | Modo layout: Pila de ventanas (superpuestos) |
| **`MOD + w`** | Modo layout: en Tabs                         |

### Integrado

|            Atajo           | Función                                              |
|:--------------------------:|------------------------------------------------------|
|    **`MOD + Shift + c`**   | Recargar I3                                          |
|    **`MOD + Shift + r`**   | Reiniciar I3                                         |
|    **`MOD + Shift + e`**   | Salir de I3                                          |
|      **`MOD + Enter`**     | Abrir terminal (Alacritty)                           |
|        **`MOD + d`**       | Abre `dmenu`                                         |

### Dunst (notificaciones)

|              Atajo              | Función                         |
|:-------------------------------:|---------------------------------|
|     **`Control + Espacio`**     | Cierra la notificación          |
| **`Control + Shift + Espacio`** | Cierra todas las notificaciones |
|    **`Control + Shift + .`**    | Abre la última notificación     |

### Custom

|          Atajo          | Función             |
|:-----------------------:|---------------------|
| **`MOD + Shift + x`** | Bloquea la pantalla |
| **`MOD + Shift + d`** | Abre `rofi`         |

## Para asociar una aplicación a un workspace:
1. Abrir la aplicación
2. Ejecutar `xprop`
3. Clickear la ventana
4. Copiar el valor XXX de la linea...
``
WM_CLASS(STRING) = "YYY", "XXX"
``
5. Poner en el config de i3: `assign [class="XXX"] $workspace10`

## Sonidos
Fuente:
- <https://invent.kde.org/plasma/ocean-sound-theme>
