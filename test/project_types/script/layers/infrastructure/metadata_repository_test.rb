# frozen_string_literal: true

require "project_types/script/test_helper"

describe Script::Layers::Infrastructure::MetadataRepository do
  let(:instance) { Script::Layers::Infrastructure::MetadataRepository.new(ctx: ctx) }
  let(:ctx) { TestHelpers::FakeContext.new }

  describe ".get_metadata" do
    subject { instance.get_metadata }

    describe "when metadata file is present and valid" do
      let(:metadata_file_location) { "metadata.json" }
      let(:metadata_json) do
        JSON.dump(
          {
            schemaVersions: {
              example: { major: "1", minor: "0" },
            },
          },
        )
      end

      it "should return a proper metadata object" do
        File.expects(:read).with(metadata_file_location).once.returns(metadata_json)
        ctx
          .expects(:file_exist?)
          .with(metadata_file_location)
          .once
          .returns(true)
        subject
      end

      describe "when filename argument is provided" do
        let(:metadata_file_location) { "build/metadata.json" }
        subject { instance.get_metadata(metadata_file_location) }
        it "should read that file" do
          File.expects(:read).with(metadata_file_location).once.returns(metadata_json)
          ctx
            .expects(:file_exist?)
            .with(metadata_file_location)
            .once
            .returns(true)
          subject
        end
      end
    end

    describe "when metadata file is missing" do
      it "should raise an exception" do
        assert_raises(Script::Layers::Domain::Errors::MetadataNotFoundError) do
          subject
        end
      end
    end
  end
end
