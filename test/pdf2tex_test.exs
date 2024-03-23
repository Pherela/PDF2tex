defmodule PDF2texTest do
  use ExUnit.Case

  alias PDF2tex, as: P

  test "retain_layout/1 extracts entire document with layout retained" do
    assert P.retain_layout("sample/sample.pdf")
  end

  test "retain_layout/3 extracts specified pages with layout retained" do
    assert P.retain_layout("sample/sample.pdf", 5, 10)
  end

  test "raw_text/1 extracts entire document as raw text" do
    assert P.raw_text("sample/sample.pdf")
  end

  test "raw_text/3 extracts specified pages as raw text" do
    assert P.raw_text("sample/sample.pdf", 5, 10)
  end
end

