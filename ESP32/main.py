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

def connectWifi(ssid, pwd):
    while not wlan.isconnected():
        print('connecting to network...')
        time.sleep(1)
        if wlan.status() == 1001:
            pass
        else:
            wlan.connect(ssid, pwd)
            
if not wlan.isconnected():
    connectWifi("MagicGlove","aeiouaei")
else:
    print('network config:', wlan.ifconfig())
    
# Crear socket UDP
server = usocket.socket(usocket.AF_INET, usocket.SOCK_DGRAM)
serverAdressPort = ("192.168.12.8", 12345)
#server.connect(serverAdressPort)

def sendUDP(data):
    try:
        server.sendto(str.encode(data), serverAdressPort)
    except:
        print("error send")
        
# Usar Giroscopio
i2c = I2C(scl = Pin(22), sda = Pin(21))
mpu = mpu6050.accel(i2c)

def conversion(x):
    return round(x * 250 / 32767, 2)

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

# Agregar ip y port de donde está el servidor UDP
#serverAddressPort = ("192.168.17.8", 3001)
# Cantidad de bytes a recibir
#bufferSize  = 128

# Create a UDP socket at client side
#sk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Función para enviar datos

# Función para recibir datos
#def receiveUDP():
 #   msg = sk.recvfrom(bufferSize)
  #  return "{}".format(msg[0])
 
# Activar si el esp32 será una estación
#from wifiSTA import connectSTA as connect
# Activar si el esp32 estará en modo de acceso AP
#from wifiAP import apConfig as connect
# poner acá el nombre de red ssid y password para conectarse
#connect("MagicGlove", "aeiouaei")



    

