class String
  define_method(:find_and_replace) do |word1, word2|
    word_array = self.downcase.split(" ")
    word1 = word1.downcase.split("")
    word2 = word2.downcase.split("")
    final_sentence = []


    counter = 0
    word_array.each().with_index do |word, i|
      word = word.split("")
      # word Word that we're searching through
      # word1 Word we're replacing
      # word2 Word we're replacing word1 with

      search_result_array = letter_search(word, word1)
      if search_result_array and counter < 1
        puts "counter is: ", counter
        # word_array.slice(i)
        final_word = letter_replaces(search_result_array, word, word2) # Correct
        # puts "final_word: ", final_word # "dogo," - Correct, loop "godplanet" - Wrong
        # print "print final_sentence before push: ", final_sentence # [] - Correct, and then ["dogo,"] 2nd loop
        final_sentence.push(final_word) # Result should be: ["dogo,"]
        # puts "final_sentence after push: ", final_sentence # dogo, loop godplanet - Wrong
        # print "final_word: ", final_word
        # word_array.insert(i, final_word)
        counter += 1
      else
        final_sentence.push(word.join(""))
      end
    end
    final_sentence.join(" ")
  end
end



define_method(:letter_search) do |word, word1|
  indices_array = []
  if word.include?(word1[0])
    letter_locator = word.index(word1[0])
    indices_array.push(letter_locator)

    counter = 1
    while counter < word1.length
      #loop through the next letters to see if they match
        #start at letter_locator index
        if word[letter_locator + counter] == word1[counter]
          indices_array.push(letter_locator + counter)
          counter += 1
        else
          false
        end
    end
  else
    false
  end
  indices_array
end



define_method(:letter_replaces) do |array_of_indices, word, word2|
  array_of_indices.each() do
    word.slice!(array_of_indices[0])
  end

  counter = 0
  word2.each() do |letter|
    word.insert((array_of_indices[counter]).to_i, letter)
    counter += 1
  end
  word.join("")
end

puts " LINE 70: ", "Hello, planet".find_and_replace("hell", "dog")
