require "inflecto"
require "dry/web/roda/generate"

module Dry
  module Web
    module Roda
      module Generators
        class FlatProject
          attr_reader :generate

          def initialize
            @generate = Generate.new("flat_project")
          end

          def call(target_dir)
            generate.(target_dir, prepare_scope(target_dir))
          end

          private

          def prepare_scope(target_dir)
            {
              underscored_app_name: Inflecto.underscore(target_dir),
              camel_cased_app_name: Inflecto.camelize(target_dir)
            }
          end
        end
      end
    end
  end
end
