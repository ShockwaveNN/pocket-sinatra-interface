# frozen_string_literal: true

# @param links [Array<String>] array of lists
# @return [Array<String>] cleaned up list of linkst
def cleanup_links_list(links)
  links.compact
end
