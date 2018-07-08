# -*- coding: utf-8 -*-
"""
	Servidor Proxy Simples em Python.
	Criado por Marcone.
	Ano 2018
"""
import socket, threading, select

# Configurations
PORTS = 80, 443
FORWARDING = '0.0.0.0:22'

def conecta(c, a):
    print('Client {} Received!'.format(a[0]))
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    ri, rp = FORWARDING.split(':')
    s.connect((ri, int(rp)))

    # Direta
    c.recv(8192)
    c.send(b"HTTP/1.1 200 Established\r\n\r\n")

    connected = True
    while connected == True:
        r, w, x = select.select([c,s], [], [c,s], 3)
        if x: connected = False; break
        for i in r:
            try:
                # Break if not data.
                data = i.recv(8192)
                if not data: connected = False; break
                if i is s:
                    # Download.
                    c.send(data)
                else:
                    # Upload.
                    s.send(data)
            except:
                connected = False
                break
    c.close()
    s.close()
    


# Listen
def listen(*port):
	l = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	l.bind(('', int(port[0])))
	l.listen(0)
	print("Running on Local Port: {}".format(port[0]))
	while True:
	    c, a = l.accept()
	    threading.Thread(target=conecta, args=(c, a)).start()
	l.close()

for i in PORTS:
	threading.Thread(target=listen, args=(i,)).start()
