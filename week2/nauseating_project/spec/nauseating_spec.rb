require 'nauseating'

describe "Phase 1" do
    describe "strange_sums" do

        it "should accept an array as an argument." do
            expect { strange_sums([1, 2, 3, 4]) }.to_not raise_error
        end

        it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
            expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)
            expect(strange_sums([42, 3, -1, -42])).to eq(1)
            expect(strange_sums([-5, 5])).to eq(1)
        end
    end

    describe "pair_product" do
        it "should accept an array of numbers and a product as arguments" do
            #expect { pair_product([4, 2, 5, 6], 16) }.to_not raise_error
        end

        it "should return a boolean indicating whether or not a pair of distinct elements in the array
        result in the product when multiplied together" do
            #expect(pair_product([4, 2, 5, 8], 16)).to eq(true)
            #expect(pair_product([8, 1, 9, 3], 8)).to eq(true)

            expect(pair_product([4, 2, 5, 7], 16)).to eq(false)

        end

    end

    describe "rampant_repeats" do
        it "should accept a string and a hash as arguments" do
            expect { rampant_repeats('taco', {'a'=>3, 'c'=>2}) }.to_not raise_error
        end

        it "should return a new string where character of the original string are repeated the number of times specified by the hash" do
            expect(rampant_repeats('taco', {'a'=>3, 'c'=>2})).to eq('taaacco')
            expect(rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})).to eq('ffffeeveerisssh')
        end   
    end

    describe "perfect_square?" do
        it "should accept a number as argument" do
            expect {perfect_square(1)}.to_not raise_error
        end

        it "should return a boolean indicating whether or not the argument is a perfect square" do
            expect(perfect_square(1)).to eq(true)
            expect(perfect_square(100)).to eq(true)
            expect(perfect_square(40)).to eq(false)
        end
    end

end


