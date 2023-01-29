# Remove files with extension .descarga

import os
import sys

path = sys.argv[1]
for root, dirs, files in os.walk(path):
    for file in files:
        if file.endswith('.descarga'):
            print('Removing: ' + os.path.join(root, file))
            os.remove(os.path.join(root, file))