module Algorithms
  module DataStructures
    module PriorityQueues
      class Base
        attr_reader :operator, :attribute

        def initialize(operator, attribute)
          @operator = operator
          @attribute = attribute
        end

        def insert(index, key)
          keys[index] = key
          pq.push(index)
          qp[index] = pq.length - 1
          swim(pq.length - 1)
        end

        def del
          pq[1].tap do
            if length > 1
              swap(1, length)
              sink(1)
            end
            pop
          end unless empty?
        end

        def length
          pq.length - 1
        end

        def empty?
          length <= 0
        end

        protected

        def keys
          @key ||= {}
        end

        def pq
          @pq ||= [0]
        end

        def qp
          @qp ||= {}
        end

        private

        def pop
          pq.pop.tap do |index|
            keys.delete(index)
            qp.delete(index)
          end
        end

        def swap(i, j)
          assert_pq_index(i, j)

          pq[i], pq[j] = pq[j], pq[i]
          qp[pq[i]], qp[pq[j]] = i, j
        end

        def swim(k)
          while k > 1 && compare(k / 2, k)
            swap(k, k / 2)
            k = k / 2
          end
        end

        def sink(k = 1)
          while (j = 2 * k) <= length - 1
            j += 1 if j < length - 1 && compare(j, j + 1)
            break if not compare(k, j)
            swap(k, j)
            k = j
          end
        end

        def assert_pq_index(*indexes)
          indexes.each do |index|
            raise "#{index} if out of pq bounds" if index < 1 and index >= pq.length
          end
        end

        def compare(i, j)
          keys[pq[i]]
            .public_send(attribute)
            .public_send(operator, keys[pq[j]].public_send(attribute))
        end
      end
    end
  end
end
