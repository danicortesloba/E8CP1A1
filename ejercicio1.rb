# 1 Crear un metodo que reciba dos strings, este metodo creara un archivo
# index.html y pondra como parrafo cada uno de los strings recibidos.

def createstring
  file = File.open('index.html', 'w')
  puts 'Ingresa el primer párrafo'
  string1 = gets.chomp
  puts 'Ingresa el segundo párrafo'
  string2 = gets.chomp
  file.puts "<p>#{string1}</p>\n<p>#{string2}</p>"
  file.close
end
createstring
# 2 Crear un metodo similar al anterior, que ademas pueda recibir un arreglo.
# Si el arreglo no esta vacio, agregar debajo de los parrafos una lista ordenada
# con cada uno de los elementos.
def createarray
  file = File.open('index2.html', 'w')
  puts 'Ingresa el primer párrafo'
  string1 = gets.chomp
  puts 'Ingresa el segundo párrafo'
  string2 = gets.chomp
  puts 'Ingresa un arreglo separado por comas'
  string3 = gets.chomp
  array = string3.split(',')
  file.puts "<p>#{string1}</p>\n<p>#{string2}</p>"
  array.each { |ele| file.puts ele }
  file.close
end
createarray

# 3 Crear un tercer metodo que ademas pueda recibir un color.
# Agregar color de fondo a los parrafos.
# El retorno de los metodos debe devolver nil.
def createcolor
  file = File.open('index3.html', 'w')
  puts 'Ingresa el primer párrafo'
  string1 = gets.chomp
  puts 'Ingresa el segundo párrafo'
  string2 = gets.chomp
  puts 'Ingresa un color'
  string3 = gets.chomp
  color = "background-color:#{string3};"
  file.puts "<p style=#{color}>#{string1}</p>\n<p style=#{color}>#{string2}</p>"
  file.close
end
createcolor
