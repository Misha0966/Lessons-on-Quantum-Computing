# Задача 4:
# Решите уравнение Шрёдингера, для системы гармонического осциллятора

using QuantumOptics

# Определение параметров гармонического осциллятора
ω = 1.0  # частота осциллятора
N = 10   # количество уровней энергии

# Создание базиса FockBasis
basis = FockBasis(N)

# Создание операторов рождения и уничтожения
a = destroy(basis)
a_dag = dagger(a)

# Гамильтониан гармонического осциллятора
hamiltonian = ω * a_dag * a

# Начальное состояние (например, осциллятор в основном состоянии)
ψ₀ = coherentstate(basis, 0.0)  # когерентное состояние с амплитудой 0

# Решение уравнения Шрёдингера
tlist = collect(0:0.1:10)  # список временных точек
tout, ψt = timeevolution.schroedinger(tlist, ψ₀, hamiltonian)