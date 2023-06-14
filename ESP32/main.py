# Este programa se diseña por Sebastian Torres
# para el proyecto Magic-glove
# taller de electronica unal 2023-1

#Modulos
import usocket
import mpu6050
import time
import math
from machine import Pin, I2C
import network


#conectar wifi
wlan = network.WLAN(network.STA_IF)
wlan.active(True)
# funcion para conectar al wifi
def connectWifi(ssid, pwd):
    while not wlan.isconnected():
        print('connecting to network...')
        time.sleep(1)
        if wlan.status() == 1001:
            pass
        else:
            wlan.connect(ssid, pwd)
#llamado a la función para conectarse
if not wlan.isconnected():
    connectWifi("MagicGlove","aeiouaei")
else:
    print('network config:', wlan.ifconfig())
    
# Crear socket UDP
server = usocket.socket(usocket.AF_INET, usocket.SOCK_DGRAM)
serverAdressPort = ("192.168.12.8", 12345)
#función para enviar datos por el socket
def sendUDP(data):
    try:
        server.sendto(str.encode(data), serverAdressPort)
    except:
        print("error send")
        
# Usar Giroscopio
i2c = I2C(scl = Pin(22), sda = Pin(21))
mpu = mpu6050.accel(i2c)
#funcion para pasar de raw a grados
def conversion(x):
    return round(x * 250 / 32767, 2)
#lectura de datos y programa principal
while True:
    temps = (mpu.get_values())
    gyroX = temps ["GyX"]
    gyroY = temps ["GyY"]
    gyroZ = temps ["GyZ"]
    tmp = temps ["Tmp"]
    gradosX = conversion(gyroX)
    gradosY = conversion(gyroY)
    gradosZ = conversion(gyroZ)
    print("grados x: ", gradosX)
    print("grados y: ", gradosY)
    print("grados z: ", gradosZ)
    print("temperatura: ", tmp)
    print()
    time.sleep_ms(10)
    sendUDP(str(gradosY))

    

