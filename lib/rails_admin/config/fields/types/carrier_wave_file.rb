if defined?(::CarrierWave)
  module RailsAdmin::Config::Fields::Types
    # Field type that supports CarrierWave file uploads
    class CarrierWaveFile < RailsAdmin::Config::Fields::Types::FileUpload
      register_instance_option(:partial) do
        :form_carrier_wave_file
      end

      register_instance_option(:formatted_value) do
        unless value.blank?
          if value.tiny
            "<a href='#{value}'}><img src='#{value.tiny.url}' /></a><a href='#{value}'}>#{value.to_s.split('/').last}</a>".html_safe
          else
            "<a href='#{value}'}>#{value.to_s.split("/").last}</a>".html_safe
          end
        else
          ""
        end
      end
    end

    register(:carrier_wave_file, CarrierWaveFile)
  end
end
