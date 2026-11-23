# ODP: overlay of upstream vcpkg port; SHA512 updated because the GitHub archive
# for libunwind v1.8.3 no longer matches the hash pinned in the vcpkg baseline.
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "libunwind/libunwind"
    REF "v${VERSION}"
    HEAD_REF master
    SHA512 f761d5af15e8ab0f9616c57c67f81e84ec2132ff53df8bfe9f1fb72fe838bc05bd02107f4a7b530910d34bef45c28fbc855b91a0c2d04017c94e3a5e181b3119
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
