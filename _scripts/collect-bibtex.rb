# Merge bibtex sources to a single file

require 'yaml'

config = YAML.load_file('_config.yml')

if config.key? 'bibtex_sources'
  sources = config['bibtex_sources']

  unless sources.respond_to?('each')
    sources = [sources]
  end

  bibouts = sources.map { |src| File.read(File.join('_data', 'bibtex_sources', src)) }
  File.write(File.join('_data', '_bibliography.bib'), bibouts.join('\n'))
end