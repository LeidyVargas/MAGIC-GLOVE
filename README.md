![Banner](./Imagenes/Poster%20Ingenia%20Futuro.jpg)

# MAGIC-GLOVE
*Un proyecto que busca, que sea posible, controlar un juego con los simples movimientos de las manos;  por ello, sera usado para fines educativos y de entretenimiento, en donde mediante el juego y la diversion, las personas podran aprender.*

Nosotros Leidy Juliana Vargas Moreno, Emmanuel Bonilla Mitrotti y Juan Sebastian Torres Rodriguez; enfocados en cambiar y revolucionar la forma convencional con la que se juegan videojuegos, y que mediante la diversión se logre desarrollar una destreza y habilidad motora, además de aprender mientras se juega, vimos una necesidad que convertimos en el siguiente objetivo:

* Diseñar y construir un guante capaz de controlar un juego, mediante el transporte de señales e información, utilizando programación y circuitos electrónicos, con el fin de revolucionar la forma típica de controlar un videojuego.

De esta manera, cualquier persona podrá divertirse de una manera diferente a “presionar botones” y además, el guante también puede ser utilizado, para juegos educativos, en donde se fomente el aprendizaje, con la diversión. Solo es cuestión de adaptarlo. 

## **DIAGRAMA DE FLUJO SOLUCIÓN**
![Diagrama de flujo](./Imagenes/Diagramas/Diagrama%20de%20flujo.jpeg "Diagrama de Flujo")

## **DIAGRAMA DE CAJA NEGRA**
Luego de ver el funcionamiento del guante, se establece un diagrama de cajas negras, en donde se busca definir lo que va a hacer este proyecto y lo que necesita, evaluado a su vez entradas y salidas, tanto de cada componente, como de energía.

En este primero se observa dicho diagrama, sin una tecnología definida:

![Diagrama de caja negra](./Imagenes/Diagramas/Diagrama%20caja%20negra%201.jpeg "Diagrama de caja negra")

Mientras que, en esta segunda imagen, se define una tecnología para cada una de las “cajas” evaluadas en el diagrama:

![Diagrama de caja negra2](./Imagenes/Diagramas/Diagrama%20caja%20negra%202.jpeg "Diagrama de caja negra2")

## **IMAGENES DE DISEÑOS EN EL SALON**
Conforme se avanzó en el proyecto, el profesor nos realizaba las respectivas correcciones y/o retroalimentaciones, en el tablero del salón; las cuales tenían que ver con la estructura del circuito, y se observan en las siguientes imágenes:

![diseño en salon 1](./Imagenes/Diagramas/Diagrama%20clase%201.jpeg "Diseño en salon 1")

![diseño en salon 2](./Imagenes/Diagramas/Diagrama%20clase%202.jpg "Diseño en salon 2")

![diseño en salon 3](./Imagenes/Diagramas/Diagrama%20clase%203.jpg "Diseño en salon 3")


## **IMPLEMENTACIÓN**
En esta sección, se empieza  diseñar, construir y montar la parte electronica y fisica del guante, por lo cual se inicia creando el circuito que relaciona cada componente que contiene el mismo, quedando de la siguiente forma: 

![Esquematico](./Imagenes/Diagramas/ESQUEMATICO%20FINAL.png "Esquematico")

Obtenido el circuito del proyecto, se empieza crear la placa de la PCB, en donde se realizan los caminos que conectan los componentes, asignando diferentes tamaños para señal, gnd y pines, utilizando el más grueso para el voltaje; los caminos se realizan en diferentes caras.

#### **Caminos de la cara frontal**
![Cara Frontal](./Imagenes/Circuito/cara%20frontal%20pcb.jpeg)
#### **Caminos de la cara trasera**
![Cara trasera](./Imagenes/Circuito/Cara%20trasera%20pcb.jpeg)

Se revisan cada uno de los posibles errores en el circuito, antes de considerarlo como resultado final, y realizado dicho proceso, se manda a construir la PCB en Yahiko electronica; 
con el archivo de los gerber que se encuentra en los archivos del GitHub como “Impresión de PCB (archivo)” . El resultado de la placa impresa se observa a continuación:

|         |           |
| ------------- |:-------------:| 
| ![Pcb impresa trasera](./Imagenes/Circuito/pcb%20impresa%20trasera.jpeg) |![Pcb impresa frontal](./Imagenes/Circuito/pcb%20impresa%20frontal.jpeg)   |

Con la PCB, se procede a montar todo el circuito en ella, para así obtener el resultado final de la parte electrónica del proyecto.

|         |           |
| ------------- |:-------------:| 
| ![Pcb 3d](./Imagenes/3d%20pcb/vista%20con%20objetos.jpg)|![Circuito montado](./Imagenes/Circuito/CIRCUITO%20MONTADO.jpeg)  | 

## **PRUEBAS**

Para las pruebas, se dividieron en dos partes: De estructura y de programación:

La pruebas de estructura consisten en el corte láser, realizado para construir la caja del guante, que contiene la pcb, en donde para el primer intento de corte (archivo que se encuentra al inicio del GitHub), se genera una disminución en las medidas; lo cual se puede observar en la siguiente imagen, donde la figura de la derecha, fue en la que se alteraron las medidas, y la de la izquierda, es el resultado esperado (final). 

![Comparacion](./Imagenes/Comparacion%20tama%C3%B1os.jpeg)

Por otro lado, se realizaron diversas pruebas de programación, pues al principio no se recibieron correctamente los datos de movimiento del giroscopio, tal como se observa en el siguiente video; pues la nave se mueve hacia otro lado diferente del giroscopio, además de que no lograba conectarse al computador, [Link del video](https://drive.google.com/file/d/1B0-Tp8vFir5iOuBAsjUjZbyzAw1yB5q_/view?usp=sharing)

Al final de las pruebas realizadas, se logra construir el guante y por tanto terminar el proyecto, el resultado y aplicación del guante, se puede observar en el siguiente video: [Link del video final. ](https://drive.google.com/file/d/1lEBwlxsq8i-k6dF0UPMbI0pn6SOiZDgC/view?usp=sharing)

![Guante en mano](./Imagenes/Circuito/Circuito%20en%20la%20mano.jpeg)