require('json')

def get_field_map
  content = File.read(Rails.root.join "config", "aardvark_fields.json")
  return JSON.parse(content)
end

# Load the field info from the Aardvark fields json file,
# preparing them to be translated into form inputs
def get_field_list(group)
  field_defs = Array(field_defs)
  field_map = get_field_map
  field_map.each do |key, value|
    if group == nil || value['display_group'] == group
      # pull the key into a new slug property
      value['slug'] = key
      # transform the "id" field so it doesn't conflict with ActiveRecord id field
      if value['uri'] == 'id' then value['uri'] = 'gbl_id' end
      # generate a nice display value from label plus extra info
      value['display_label'] = value['label']
      if value['obligation'] != "optional" then value['display_label'] << " (#{value['obligation'][0].upcase})" end
      if value['multiple'] == true then value['display_label'] << " + " end
      field_defs << value
    end
  end
  return field_defs
end

# Sort all fields into a hash by display group
def get_fields_by_group
  out_hash = {
    :identifiers => get_field_list("Identifiers"),
    :descriptive => get_field_list("Descriptive"),
    :credits => get_field_list("Credits"),
    :categories => get_field_list("Categories"),
    :temporal => get_field_list("Temporal"),
    :spatial => get_field_list("Spatial"),
    :relations => get_field_list("Relations"),
    :rights => get_field_list("Rights"),
    :object => get_field_list("Object"),
    :links => get_field_list("Links"),
    :admin => get_field_list("Admin"),
  }
  puts out_hash
  return out_hash
end

class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
    respond_to do |format|
      format.html
      format.json{
        render :json => @record.to_json
      }
    end
  end

  def new
    @fields_by_group = get_fields_by_group
  end

  def edit
    @fields_by_group = get_fields_by_group
    @record = Record.find(params[:id])
  end

  def create
    record = Record.new(record_params)
    record.save
    redirect_to root_path
  end
  
  def update
    record = Record.find(params[:id])
    record.update(record_params)
    redirect_to root_path
  end

  def delete
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_path
  end

  private
  
  def record_params
    params.require(:record)
      .permit(
        :dct_title_s,
        :dct_alternative_sm,
        :dct_description_sm,
        :dct_language_sm,
        :gbl_displayNote_sm,
        # Credits,
        :dct_creator_sm,
        :dct_publisher_sm,
        :schema_provider_s,
        # Categories,
        :gbl_resourceClass_sm,
        :gbl_resourceType_sm,
        :dct_subject_sm,
        :dcat_theme_sm,
        :dcat_keyword_sm,
        # Temporal,
        :dct_temporal_sm,
        :dct_issued_s,
        :gbl_indexYear_im,
        :gbl_dateRange_drsim,
        # Spatial,
        :dct_spatial_sm,
        :locn_geometry,
        :dcat_bbox,
        :dcat_centroid,
        :gbl_georeferenced_b,
        # Relations,
        :dct_relation_sm,
        :pcdm_memberOf_sm,
        :dct_isPartOf_sm,
        :dct_source_sm,
        :dct_isVersionOf_sm,
        :dct_replaces_sm,
        :dct_isReplacedBy_sm,
        # Rights,
        :dct_rights_sm,
        :dct_rightsHolder_sm,
        :dct_license_sm,
        :dct_accessRights_s,
        # Object,
        :dct_format_s,
        :gbl_fileSize_s,
        # Links,
        :dct_references_s,
        :gbl_wxsIdentifier_s,
        # Identifiers,
        :gbl_id,
        :dct_identifier_sm,
        # Admin,
        :gbl_mdModified_dt,
        :gbl_mdVersion_s,
        :gbl_suppressed_b,
      )
      .transform_values {|v| v == "" ? nil : v}
      .transform_values {|v| v == "[]" ? nil : v}
  end
end
