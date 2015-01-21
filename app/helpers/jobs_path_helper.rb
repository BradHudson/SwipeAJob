#require 'core_ext/string'
#require 'cgi'

module JobsPathHelper
  def friendly_jobs_link(search_attributes = {})
    search_attrs = search_attrs_to_hash(search_attributes)

    search_attrs[:keywords] = transform_url_param(search_attributes[:keywords])
    search_attrs[:location] = transform_url_param(search_attributes[:location])

    if search_attrs[:keywords].blank? && search_attrs[:location].blank?
      jobs_path search_attrs
    elsif search_attributes[:keywords].blank?
      jobs_location_path search_attrs
    elsif search_attributes[:location].blank?
      jobs_keyword_path search_attrs
    else
      jobs_keyword_location_path search_attrs
    end
  rescue
    jobs_path
  end

  private

  def search_attrs_to_hash(search_attributes)
    search_attrs = if search_attributes.respond_to?(:to_h)
                     search_attributes.to_h
                   elsif search_attributes.respond_to?(:to_hash)
                     search_attributes.to_hash
                   else
                     search_attributes || {}
                   end
    search_attrs.symbolize_keys!
    search_attrs
  end

  def transform_url_param(url_param)
    url_param = nil if url_param.blank?
    if url_param.present?
      unless url_param.ascii_only?
        url_param = CGI.escape(url_param)
      end
      url_param = url_param.to_slug
    end
    url_param
  end
end
