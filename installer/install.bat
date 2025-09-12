@echo off

:: Download audio pack
wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Japanese_4.0.0.zip"
Powershell -Command "Expand-Archive -Path Audio_Japanese_4.0.0.zip -DestinationPath C:\Grasscutter\Audio"
del "Audio_Japanese_4.0.0.zip"

:: Download the game itself
wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/GenshinImpact_4.0.0.zip"
Powershell -Command "Expand-Archive -Path Audio_Japanese_4.0.0.zip -DestinationPath C:\Grasscutter\Genshin"
del "GenshinImpact_4.0.0.zip"