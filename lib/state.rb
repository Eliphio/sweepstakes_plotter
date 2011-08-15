class State < EnumerateIt::Base
  associate_values(
    :mg   => [1, 'MG'],
    :sp   => [2, 'SP'],
    :rj   => [3, 'RJ']
  )
end