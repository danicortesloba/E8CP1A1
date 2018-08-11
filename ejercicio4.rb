# La opcion 1 permite conocer la cantidad de productos existentes. Al
# seleccionar esta opcion, se mostrara un submenu que permitira:

def productexistence
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  sum = 0
  name = nil
  data.each do |product|
    array = product.split(', ').map(&:chomp)
    name = array.shift
    sum = array.inject(0) { |suma, grade| suma + grade.to_f }
    puts "#{name}: #{sum}"
  end
end

def storeexistence
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  store1 = 0
  store2 = 0
  store3 = 0
  array = nil
  data.each do |product|
    array = product.split(', ').map(&:chomp)
    store1 += array[1].to_i
    store2 += array[2].to_i
    store3 += array[3].to_i
  end
  puts store1
  puts store2
  puts store3
end

def globalexistence
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  totalsum = 0
  data.each do |product|
    array = product.split(', ').map(&:chomp)
    array.shift
    sum = array.inject(0) { |suma, amount| suma + amount.to_f }
    totalsum += sum
  end
  puts totalsum
end

def submenu
  p 'Presiona Enter'
  option2 = gets.chomp
  while option2 != 'd'
    p 'a: Muestra la existencia por productos'
    p 'b: Muestra la existencia total por tienda'
    p 'c: Muestra la existencia total en todas las tiendas'
    p 'd: Volver al menú principal'

    option2 = gets.chomp
    puts case option2
         when 'a'
           productexistence
         when 'b'
           storeexistence
         when 'c'
           globalexistence
         when 'd'
           exit
         else
           p 'Esa no es una opción válida. Recuerda ingresar una letra de a a d'
         end
  end
end

# La opcion 2 permite que el usuario ingrese el nombre de un producto y
# el programa respondera con la cantidad de stock total (suma en las bodegas)
# de ese producto.

def totalstock
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  sum = 0
  puts '¿Qué producto necesita?'
  product = gets.chomp
  data.each do |stock|
    array = stock.split(', ').map(&:chomp)
    name = array.shift
    if name == product then
      sum = array.inject(0) { |suma, grade| suma + grade.to_f }
      puts sum
    end
  end
end

# La opcion 3 muestra los productos no registrados en cada bodega.

def unregistered
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  data.each do |stock|
    array = stock.split(', ').map(&:chomp)
    name = array.shift
    if stock.include? "NR" then
      puts name
    end
  end
end

# La opcion 4 permite conocer los productos con una existencia total
# menor a un valor ingresado por el usuario.

def lowstock
  file = File.open('productos.txt', 'r')
  data = file.readlines
  file.close
  sum = 0
  name = nil
  puts '¿Cuál es el mínimo de stock necesario?'
  minimum = gets.chomp.to_i
  data.each do |product|
    array = product.split(', ').map(&:chomp)
    name = array.shift
    sum = array.inject(0) { |suma, grade| suma + grade.to_f }
    if sum <= minimum then
      puts "#{name} tiene stock bajo"
    end
  end
end

# La opcion 5 permite registrar un nuevo producto con su respectivo
# stock en cada bodega. (Hint: abrir el archivo como append).

def newproduct
  file = File.open('productos.txt', 'a')
  puts 'Ingresa el producto y su stock, separado por comas'
  newproduct = gets.chomp
  file.puts newproduct
end

# Menu start
p 'Presiona Enter'

option = gets.chomp.to_i

while option != 6
  p 'Opción 1: Permite conocer la cantidad de productos existentes'
  p 'Opción 2: Muestra la cantidad de stock total de un producto'
  p 'Opción 3: Muestra los productos no registrados en cada bodega'
  p 'Opción 4: Muestra productos con existencia menor a la ingresada'
  p 'Opción 5: Permite ingresar un nuevo producto y su stock para cada bodega'
  p 'Opción 6: Salir'

  option = gets.chomp.to_i
  puts case option
       when 1
         submenu
       when 2
         totalstock
       when 3
         unregistered
       when 4
         lowstock
       when 5
         newproduct
       when 6
         exit
       else
         p 'Esa no es una opción válida. Recuerda ingresar un número del 1 al 6'
       end
end
# Si el usuario ingresa la opcion 6 el programa sale, si ingresa
# cualquier otra opcion se debe mostrar que la opcion es invalida, y
# mostrar el menu nuevamente y la opcion de elegir.
