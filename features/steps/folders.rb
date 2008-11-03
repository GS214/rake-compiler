Given /^a safe project directory$/ do
  tmp_name = "project.#{Process.pid}"
  @safe_dir = File.join(ROOT_PATH, 'tmp', tmp_name)
  FileUtils.rm_rf @safe_dir
  FileUtils.mkdir_p @safe_dir
  Dir.chdir @safe_dir
end

Given /^'(.*)' folder (exist|is deleted)$/ do |folder, condition|
  case condition
    when 'exist'
      raise "Folder #{folder} do not exist" unless File.exist?(folder) && File.directory?(folder)
    when 'is deleted'
      FileUtils.rm_rf folder
  end
end

Then /^'(.*)' folder is created$/ do |folder|
  File.exist?(folder).should be_true
end
