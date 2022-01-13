# frozen_string_literal: true

module Script
  module Layers
    module Infrastructure
      module Languages
        class OtherProjectCreator < ProjectCreator
          def self.config_file
            "script.config.yml"
          end
        end
      end
    end
  end
end
