# Crear un metodo que lea el archivo, lo abra y devuelva
# la cantidad de lineas que posee.
def countlines
  file = File.open('peliculas.txt', 'r')
  data = file.readlines
  file.close
  puts data.length
end
countlines
