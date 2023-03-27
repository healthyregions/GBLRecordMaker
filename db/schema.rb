# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_21_150045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: :cascade do |t|
    t.string "dct_title_s", null: false
    t.string "dct_alternative_sm"
    t.string "dct_description_sm"
    t.string "dct_language_sm"
    t.string "gbl_displayNote_sm"
    t.string "dct_creator_sm"
    t.string "dct_publisher_sm"
    t.string "schema_provider_s"
    t.string "gbl_resourceClass_sm"
    t.string "gbl_resourceType_sm"
    t.string "dct_subject_sm"
    t.string "dcat_theme_sm"
    t.string "dcat_keyword_sm"
    t.string "dct_temporal_sm"
    t.string "dct_issued_s"
    t.string "gbl_indexYear_im"
    t.string "gbl_dateRange_drsim"
    t.string "dct_spatial_sm"
    t.string "locn_geometry"
    t.string "dcat_bbox"
    t.string "dcat_centroid"
    t.boolean "gbl_georeferenced_b"
    t.string "dct_relation_sm"
    t.string "pcdm_memberOf_sm"
    t.string "dct_isPartOf_sm"
    t.string "dct_source_sm"
    t.string "dct_isVersionOf_sm"
    t.string "dct_replaces_sm"
    t.string "dct_isReplacedBy_sm"
    t.string "dct_rights_sm"
    t.string "dct_rightsHolder_sm"
    t.string "dct_license_sm"
    t.string "dct_accessRights_s"
    t.string "dct_format_s"
    t.string "gbl_fileSize_s"
    t.json "dct_references_s"
    t.string "gbl_wxsIdentifier_s"
    t.string "gbl_id"
    t.string "dct_identifier_sm"
    t.string "gbl_mdModified_dt"
    t.string "gbl_mdVersion_s", default: "Aardvark", null: false
    t.boolean "gbl_suppressed_b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gbl_id"], name: "index_records_on_gbl_id", unique: true
  end

end
