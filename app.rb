

#require_relative "dictionary_loader.rb"

require_relative "dictionary_ui.rb"

require_relative "dictionary_searcher.rb"

#for the main page
d = DictionaryUI.new
d.run





#for the main page
start = DictionarySearcher.new
start.searcher

class ResultsSaver
  # takes a batch of results and writes them to a file.
  def initialize()
    p "Do you want to save results? y/n? 'q' quits."
  end

  def getresponse()
    @response = gets.chomp
  end

  def savefile()
    p "What filepath should we write results to?"
    @path = gets.chomp
    out_file = File.new("#{@path}", "w+")
    $results.each do |str|
      out_file.puts("#{str}")
    end
    out_file.close
    p "File saved. Congrats!"
  end

  def conditional()
    if @response == 'y'
      savefile()
    elsif @response == 'n'
    else
      p "Your response was invalid"
      p "Do you want to save results? y/n? 'q' quits."
      getresponse()
    end
  end

end

startsaving = ResultsSaver.new
startsaving.getresponse
startsaving.conditional
