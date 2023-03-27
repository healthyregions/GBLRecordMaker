class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      # Descriptive
      t.string 'dct_title_s', null: false
      t.string 'dct_alternative_sm'#, array: true, default: nil
      t.string 'dct_description_sm'
      t.string 'dct_language_sm'#, array: true
      t.string 'gbl_displayNote_sm'#, array: true
      # Credits
      t.string 'dct_creator_sm'#, array: true
      t.string 'dct_publisher_sm'#, array: true
      t.string 'schema_provider_s'
      # Categories
      t.string 'gbl_resourceClass_sm'#, null: false, array: true
      t.string 'gbl_resourceType_sm'#, array: true
      t.string 'dct_subject_sm'#, array: true
      t.string 'dcat_theme_sm'#, array: true
      t.string 'dcat_keyword_sm'#, array: true
      # Temporal
      t.string 'dct_temporal_sm'#, array: true
      t.string 'dct_issued_s'
      t.string 'gbl_indexYear_im'#, array: true
      t.string 'gbl_dateRange_drsim'
      # Spatial
      t.string 'dct_spatial_sm'#, array: true
      t.string 'locn_geometry'
      t.string 'dcat_bbox'
      t.string 'dcat_centroid'
      t.boolean 'gbl_georeferenced_b'
      # Relations
      t.string 'dct_relation_sm'#, array: true
      t.string 'pcdm_memberOf_sm'#, array: true
      t.string 'dct_isPartOf_sm'#, array: true
      t.string 'dct_source_sm'#, array: true
      t.string 'dct_isVersionOf_sm'#, array: true
      t.string 'dct_replaces_sm'#, array: true
      t.string 'dct_isReplacedBy_sm'#, array: true
      # Rights
      t.string 'dct_rights_sm'#, array: true
      t.string 'dct_rightsHolder_sm'#, array: true
      t.string 'dct_license_sm'#, array: true
      t.string 'dct_accessRights_s'#, null: false
      # Object
      t.string 'dct_format_s'
      t.string 'gbl_fileSize_s'
      # Links
      # dct_references_s --> output must be serialized to string
      t.json 'dct_references_s' 
      t.string 'gbl_wxsIdentifier_s'
      # Identifiers
      t.string 'gbl_id'#, null: false
      t.string 'dct_identifier_sm'#, array: true
      # Admin
      t.string 'gbl_mdModified_dt'#, null: false
      t.string 'gbl_mdVersion_s', default: 'Aardvark', null: false
      t.boolean 'gbl_suppressed_b'
      
      t.timestamps
    end
    # enforce uniqueness on gbl_id field
    add_index :records, :gbl_id, unique: true
  end
end
