module Fixtures
  extend self

  def xcdatamodeld
    'spec/resources/Model.xcdatamodeld'
  end

  def expected_dir
    'spec/resources/expected'
  end

  def generated_dir
    'spec/resources/tmp'
  end

  def generated_file_content(name)
    read_file(generated_dir, name)
  end

  def expected_content(name)
    read_file(expected_dir, name)
  end

  def read_file(directory, file)
    File.read(File.join(directory, file))
  end

  def delete_tmp_files(files)
    files.each { |file|
      path = File.join(generated_dir, file)
      File.delete(path) if File.exists?(path)
    }
  end
end
