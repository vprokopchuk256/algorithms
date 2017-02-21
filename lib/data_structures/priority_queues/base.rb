module Algorithms
  module DataStructures
    module PriorityQueues
      class Base
        def initialize(operator, property)
          @arr = [nil]
          @operator = operator
          @property = property
        end

        def empty?
          @arr.length <= 1
        end

        def del
          return nil if empty?
          return @arr.pop if @arr.length == 2

          max = @arr[1]
          @arr[1] = @arr.pop
          sink
          max
        end

        def insert(value)
          @arr.push(value)
          swim
        end

        private

        def swim(k = last_index)
          swap(k / 2, k) while k > 1 && compare(k / 2, k)
        end

        def sink(k = 1)
          while (j = 2 * k) <= @arr.length - 1
            j += 1 if j < last_index && compare(j, j + 1)
            break if not compare(k, j)
            swap(k, j)
          end
        end

        def swap(i, j)
          @arr[i], @arr[j] = @arr[j], @arr[i]
        end

        def last_index
          @arr.length - 1
        end

        def compare(i, j)
          @arr[i].public_send(@property).public_send(@operator, @arr[j].public_send(@property))
        end
      end
    end
  end
end
