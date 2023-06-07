import usocket as socket

# Agregar ip y port de donde está el servidor UDP
serverAddressPort = ("192.168.29.8", 3000)
# Cantidad de bytes a recibir
bufferSize  = 128

# Create a UDP socket at client side
sk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Función para enviar datos
def sendUDP(data):
    sk.sendto(str.encode(data), serverAddressPort)

# Función para recibir datos
def receiveUDP():
    msg = sk.recvfrom(bufferSize)
    return "{}".format(msg[0])
 
# Activar si el esp32 será una estación
from wifiSTA import connectSTA as connect

# Activar si el esp32 estará en modo de acceso AP
#from wifiAP import apConfig as connect

# poner acá el nombre de red ssid y password para conectarse
connect("Esp32", "aeiouaei")

# Función que podrá usar para enviar datos al servidor UDP
sendUDP("350-350")
