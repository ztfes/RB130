class TextAnalyzer
  def process
    # count paragraphs (empty lines)
    # count lines (inlucding empty)
    # count words (punctiation characters do not count, but single letters count)
    textfile = File.open('sample_text.txt', 'r')
    puts yield(textfile.read)
    textfile.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process { |text| "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| "#{text.lines.count} lines" }
analyzer.process { |text| "#{text.split(" ").count} words" }