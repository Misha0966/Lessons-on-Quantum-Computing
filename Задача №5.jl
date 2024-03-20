# Реализуйте квантовую схему, затем примените данную квантовую схему 
# к начальному состоянию двух кубитов.
# Вычислите результат измерения состояния после применения схемы.

using Yao

# Определение кастомного типа для нашего квантовой схемы
mutable struct MyChainBlock{N} <: CompositeBlock{N}
    circuit::ChainBlock{N}
end

# Перегрузка функции apply! для нашего кастомного типа
function Yao.apply!(r::ArrayReg, block::MyChainBlock)
    return apply!(r, block.circuit)
end

# Определение квантовой схемы
circuit = chain(2, put(1=>X), control(1, 2=>X), put(2=>X))
# Создание состояния кубитов
state = zero_state(2)

# Применение квантовой схемы к состоянию
result = apply!(state, MyChainBlock(circuit))

# Вывод результата
@show measure(result)