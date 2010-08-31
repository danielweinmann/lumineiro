module WillPaginate
  module ViewHelpers
    pagination_options[:previous_label] = '&laquo; Anterior'
    pagination_options[:next_label] = 'Próxima &raquo;'

    def page_entries_info(collection, options = {})
      entry_name = options[:entry_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
      entry_name_plural = options[:entry_name_plural] || entry_name.pluralize

      return "Nenhum #{entry_name} encontrado" if collection.empty?

      if collection.total_pages < 2
        case collection.size
          when 0; "Nenhum #{entry_name} encontrado"
          when 1; "Apresentando <b>1</b> #{entry_name}"
          else;   "Apresentando <b>#{collection.size}</b> #{entry_name_plural}"
        end
      else
        %{Apresentando #{entry_name_plural} <b>%d&nbsp;-&nbsp;%d</b> de <b>%d</b> no total} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
      end
    end
  end
end

