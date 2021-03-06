# frozen_string_literal: true
module Edtf
  module Humanize
    module Season
      include Edtf::Humanize::Formats
      include Edtf::Humanize::Strategies

      def basic_humanize
        "#{apply_prefix_if_approximate(self)}"\
        "#{translate_season(season)} #{year}"\
        "#{apply_suffix_if_approximate(self)}"\
        "#{apply_if_uncertain(self)}"
      end

      private

      def translate_season(season)
        
          I18n.translate!("date.seasons.#{self.season}")
        rescue I18n::MissingTranslationData
          self.season
        
      end
    end
  end
end
