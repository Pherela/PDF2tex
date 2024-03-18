defmodule PDF2texTest do
  use ExUnit.Case
  doctest PDF2tex

  @sample "sample/sample.pdf"
  @bad_sample "sample/sample.pdfs"

  test "retain_layout" do
    assert PDF2tex.retain_layout(@sample)
  end

  test "if retain_layout fail" do
    assert PDF2tex.retain_layout(@bad_sample)
  end

  test "raw_text" do
    assert PDF2tex.raw_text(@sample)
  end

  test "if raw_text fail" do
    assert PDF2tex.raw_text(@bad_sample)
  end
end
