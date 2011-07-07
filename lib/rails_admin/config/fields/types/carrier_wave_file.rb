if defined?(::CarrierWave)
  module RailsAdmin::Config::Fields::Types
    # Field type that supports CarrierWave file uploads
    class CarrierWaveFile < RailsAdmin::Config::Fields::Types::FileUpload

      register_instance_option(:delete_method) do
        "delete_#{name}" if bindings[:object].respond_to?("delete_#{name}")
      end

      def value
        "<a href='#{bindings[:object].send(name).try(:url)}'>#{bindings[:object].send(name).try(:url)}</a>".html_safe
      end

      register_instance_option(:partial) do
        :form_carrier_wave_file
      end

    end

    register(:carrier_wave_file, CarrierWaveFile)
  end
end
