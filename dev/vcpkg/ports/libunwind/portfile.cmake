# ODP: overlay of the upstream vcpkg port. GitHub auto-generated archives are not
# bit-stable, so the SHA512 pinned in the vcpkg baseline for the v1.8.3 tarball can
# drift even though the tag is unchanged. Fetch the exact commit with git instead
# (a commit SHA is content-addressed, so there is no archive checksum to drift).
# 7bda80a564cddc5b215a84509026030cf16dfd94 is the commit behind tag v1.8.3.
vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/libunwind/libunwind
    REF 7bda80a564cddc5b215a84509026030cf16dfd94
    PATCHES
        liblzma.diff
)

vcpkg_find_acquire_program(PKGCONFIG)

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    OPTIONS
        --disable-documentation
        --disable-tests
        --disable-zlibdebuginfo
        --enable-minidebuginfo
)
vcpkg_install_make()
vcpkg_fixup_pkgconfig()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
