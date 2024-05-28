#!/bin/bash

# Tentukan nama folder yang ingin dikompresi
folder_name="bot"

# Tentukan nama file zip yang dihasilkan
zip_file="kyt.zip"

# Gunakan perintah zip untuk mengompresi folder
zip -r "$zip_file" "$kyt"
