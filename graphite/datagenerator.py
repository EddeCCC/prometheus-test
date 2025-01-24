import graphyte
import time
import random
import os

print(">>> STARTING GENERATOR")

graphite_host = os.environ.get("GRAPHITE_HOST", "localhost")
graphite_port = int(os.environ.get("GRAPHITE_PORT", 2003))
print(f">>> SENDING DATA TO: {graphite_host}:{graphite_port}")

graphyte.init(graphite_host, port=graphite_port, prefix='synthetic')

while True:
    value = random.uniform(0.0, 100.0)
    print(f">>> NEW VALUE: {value}")

    graphyte.send('cpu.util', value)
    time.sleep(5)
