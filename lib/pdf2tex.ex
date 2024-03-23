defmodule PDF2tex do
  @moduledoc """
  A module for converting PDF files to text using the `pdftotext` command.
  """

  @doc """
  Converts a PDF file to text while retaining the layout.

  ## Parameters

  - `input_pdf`: The path to the input PDF file.
  - `start_page`: (Optional) The first page to convert. If not provided, conversion starts from the first page.
  - `end_page`: (Optional) The last page to convert. If not provided, conversion goes up to the last page.
  """
  def retain_layout(input_pdf, start_page \\ nil, end_page \\ nil) do
    args = ["-layout", input_pdf, "-"]
    args = cond do
      start_page && end_page -> ["-f", Integer.to_string(start_page), "-l", Integer.to_string(end_page) | args]
      start_page -> ["-f", Integer.to_string(start_page) | args]
      end_page -> ["-l", Integer.to_string(end_page) | args]
      true -> args
    end
    execute_pdftotext(args)
  end

  @doc """
  Converts a PDF file to raw text.

  ## Parameters

  - `input_pdf`: The path to the input PDF file.
  - `start_page`: (Optional) The first page to convert. If not provided, conversion starts from the first page.
  - `end_page`: (Optional) The last page to convert. If not provided, conversion goes up to the last page.
  """
  def raw_text(input_pdf, start_page \\ nil, end_page \\ nil) do
    args = ["-raw", input_pdf, "-"]
    args = cond do
      start_page && end_page -> ["-f", Integer.to_string(start_page), "-l", Integer.to_string(end_page) | args]
      start_page -> ["-f", Integer.to_string(start_page) | args]
      end_page -> ["-l", Integer.to_string(end_page) | args]
      true -> args
    end
    execute_pdftotext(args)
  end

  defp execute_pdftotext(args) do
    case System.cmd("pdftotext", args) do
      {output, 0} -> output
      {output, _} -> output
    end
  end
end

