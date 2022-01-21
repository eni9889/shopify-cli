
require "project_types/script/test_helper"

describe Script::Layers::Infrastructure::Languages::WasmTaskRunner do
  let(:ctx) { TestHelpers::FakeContext.new }
  let(:script_name) { "foo" }
  let(:library_name) { "@shopify/extension-point-as-fake" }
  let(:runner) { Script::Layers::Infrastructure::Languages::WasmTaskRunner.new(ctx, script_name) }

  describe ".dependencies_installed?" do
    subject { runner.dependencies_installed? }

    it "should always return true" do
      assert subject
    end
  end

  describe ".library_version" do
    subject { runner.library_version(library_name) }

    it "should always return nil" do
      assert_nil subject
    end
  end

  describe ".compiled_type" do
    subject { runner.compiled_type }

    it "should always return wasm" do
      assert_equal "wasm", subject
    end
  end

  describe ".metadata_file_location" do
    subject { runner.metadata_file_location }

    it "should return the file location" do
      assert_equal "metadata.json", subject
    end
  end
end
