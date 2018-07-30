# 1 Crear un metodo que reciba el archivo peliculas.txt,
# lo abra y cuente la cantidad total de palabras.
# El metodo debe devolver este valor.
def countwords
  file = File.open('peliculas.txt', 'r')
  data = file.readlines
  file.close
  sum = 0
  data.each do |movie|
    array = movie.split(' ').map(&:chomp)
    size = array.length
    sum += size
  end
  puts sum
end
countwords

# 2 Crear un metodo similar para que ademas reciba -como argumento- un string.
# En este caso el metodo debe contar unicamente las apariciones
# de ese string en el archivo.
def includestring
  sum = 0
  file = File.open('peliculas.txt', 'r')
  data = file.readlines
  file.close
  puts '¿Qué buscas?'
  string = gets.chomp
  data.each do |movie|
    if movie.include?(string) then sum += 1 end
  end
  puts sum
end
includestring
