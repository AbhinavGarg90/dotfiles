local diagnostics_enabled = true

vim.api.nvim_create_user_command("ToggleLspDiagnostic", function()
    diagnostics_enabled = not diagnostics_enabled

    vim.diagnostic.enable(diagnostics_enabled)

    vim.notify(
        "LSP Diagnostics " .. (diagnostics_enabled and "Enabled" or "Disabled"),
        vim.log.levels.INFO
    )
end, {})
