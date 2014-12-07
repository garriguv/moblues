module Fixtures
  extend self

  def xcdatamodeld
    'spec/resources/Model.xcdatamodeld'
  end

  def expected_dir(language)
    "spec/resources/expected/#{language}"
  end

  def generated_dir(language)
    "spec/resources/tmp/#{language}"
  end

  def generated_file_content(name, language)
    read_file(generated_dir(language), name)
  end

  def expected_content(name, language)
    read_file(expected_dir(language), name)
  end

  def read_file(directory, file)
    File.read(File.join(directory, file))
  end

  def delete_tmp_files(files, language)
    files.each { |file|
      path = File.join(generated_dir(language), file)
      File.delete(path) if File.exists?(path)
    }
  end
end
