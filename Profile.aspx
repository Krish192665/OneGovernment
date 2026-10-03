<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OneGovernment.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .profile-page {
        --profile-ink: #0f172a;
        --profile-muted: #64748b;
        --profile-line: #e2e8f0;
        width: min(100% - 40px, 960px);
        margin: 28px auto 48px;
        color: var(--profile-ink);
        font-family: inherit;
    }

    .profile-heading { margin-bottom: 20px; }
    .profile-kicker {
        margin: 0 0 5px;
        color: #1e6fd8;
        font-size: 11px;
        font-weight: 800;
        letter-spacing: 1px;
        text-transform: uppercase;
    }
    .profile-title { margin: 0; color: var(--profile-ink); font-size: 27px; font-weight: 750; }
    .profile-subtitle { margin: 6px 0 0; color: var(--profile-muted); font-size: 13px; }

    .profile-board {
        display: grid;
        grid-template-columns: 250px minmax(0, 1fr);
        overflow: hidden;
        border: 1px solid var(--profile-line);
        border-radius: 12px;
        background: #ffffff;
        box-shadow: 0 8px 25px rgba(15, 23, 42, .07);
        animation: profile-in .32s ease-out both;
    }

    @keyframes profile-in {
        from { opacity: 0; transform: translateY(6px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .profile-summary {
        display: flex;
        min-width: 0;
        flex-direction: column;
        align-items: flex-start;
        padding: 28px 23px;
        background: #155ab0;
        color: #ffffff;
    }
    .profile-summary-label {
        margin: 0 0 28px;
        color: #dbeafe;
        font-size: 10px;
        font-weight: 750;
        letter-spacing: 1px;
        text-transform: uppercase;
    }
    .profile-avatar {
        position: relative;
        display: flex;
        width: 82px;
        height: 82px;
        flex: 0 0 82px;
        align-items: center;
        justify-content: center;
        align-self: center;
        margin-bottom: 18px;
        border: 2px solid rgba(255,255,255,.68);
        border-radius: 50%;
        background: #eff6ff;
        color: #155ab0;
    }
    .profile-avatar-fallback,
    .profile-avatar img {
        position: absolute;
        inset: 0;
        display: flex;
        width: 100%;
        height: 100%;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        object-fit: cover;
    }
    .profile-avatar-fallback { font-size: 25px; font-weight: 750; }
    .profile-avatar img[hidden] { display: none; }
    .profile-name {
        overflow-wrap: anywhere;
        margin: 0;
        color: #ffffff;
        font-size: 20px;
        font-weight: 750;
        line-height: 1.3;
    }
    .profile-email {
        overflow-wrap: anywhere;
        margin: 7px 0 0;
        color: #dbeafe;
        font-size: 12px;
        line-height: 1.5;
    }
    .profile-summary-note {
        margin: auto 0 0;
        padding-top: 34px;
        color: #dbeafe;
        font-size: 11px;
        line-height: 1.6;
    }

    .profile-details { min-width: 0; padding: 26px 28px 23px; }
    .profile-details-heading {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        margin-bottom: 20px;
        padding-bottom: 17px;
        border-bottom: 1px solid var(--profile-line);
    }
    .profile-details-title { margin: 0; color: var(--profile-ink); font-size: 17px; font-weight: 750; }
    .profile-details-note { margin: 5px 0 0; color: var(--profile-muted); font-size: 12px; }

    .profile-edit-link {
        display: inline-flex;
        min-height: 38px;
        flex: 0 0 auto;
        align-items: center;
        justify-content: center;
        gap: 7px;
        padding: 0 12px;
        border: 1px solid #c9d9f1;
        border-radius: 6px;
        background: #f5f9ff;
        color: #155ab0;
        font-size: 12px;
        font-weight: 700;
        text-decoration: none;
        transition: background .15s ease, border-color .15s ease;
    }
    .profile-edit-link:hover,
    .profile-edit-link:focus-visible {
        border-color: #8bb5ed;
        background: #eaf3ff;
        color: #104a91;
        text-decoration: none;
    }
    .profile-edit-link svg { width: 14px; height: 14px; }

    .profile-details-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 0 20px;
    }
    .profile-detail {
        min-width: 0;
        padding: 14px 0;
        border-bottom: 1px solid #edf1f5;
    }
    .profile-detail:nth-last-child(-n+2) { border-bottom: 0; }
    .profile-detail-label {
        margin: 0 0 6px;
        color: #718096;
        font-size: 10px;
        font-weight: 750;
        letter-spacing: .65px;
        text-transform: uppercase;
    }
    .profile-detail-value {
        overflow-wrap: anywhere;
        margin: 0;
        color: #1e293b;
        font-size: 13px;
        font-weight: 650;
    }

    .profile-details-footer {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-top: 17px;
        padding: 11px 12px;
        border: 1px solid #e1eaf7;
        border-radius: 6px;
        background: #f7faff;
        color: #53687f;
        font-size: 11px;
        line-height: 1.5;
    }
    .profile-details-footer svg { width: 15px; height: 15px; flex: 0 0 15px; color: #1e6fd8; }

    .profile-page a:focus-visible { outline: 3px solid #7ab0f2; outline-offset: 3px; }

    @media (max-width: 760px) {
        .profile-page { width: calc(100% - 28px); margin: 20px auto 32px; }
        .profile-board { grid-template-columns: minmax(0, 1fr); }
        .profile-summary {
            display: grid;
            grid-template-columns: 70px minmax(0, 1fr);
            align-items: center;
            column-gap: 16px;
            padding: 20px;
        }
        .profile-summary-label { grid-column: 1 / -1; margin: 0 0 14px; }
        .profile-avatar { grid-column: 1; grid-row: 2 / span 2; justify-self: center; width: 66px; height: 66px; margin: 0; }
        .profile-avatar svg { width: 34px; height: 34px; }
        .profile-name { grid-column: 2; align-self: end; font-size: 18px; }
        .profile-email { grid-column: 2; align-self: start; margin-top: 4px; }
        .profile-summary-note { grid-column: 1 / -1; margin-top: 14px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,.2); }
        .profile-details { padding: 22px 20px; }
    }

    @media (max-width: 480px) {
        .profile-page { width: calc(100% - 24px); margin: 16px auto 28px; }
        .profile-title { font-size: 24px; }
        .profile-details { padding: 19px 16px; }
        .profile-details-heading { align-items: flex-start; flex-direction: column; }
        .profile-edit-link { align-self: flex-start; }
        .profile-details-grid { grid-template-columns: minmax(0, 1fr); }
        .profile-detail:nth-last-child(2) { border-bottom: 1px solid #edf1f5; }
        .profile-detail:last-child { border-bottom: 0; }
    }

    @media (prefers-reduced-motion: reduce) {
        .profile-board, .profile-edit-link { animation: none; transition: none; }
    }
</style>

<div class="profile-page">
    <header class="profile-heading">
        <p class="profile-kicker">Citizen account</p>
        <h1 class="profile-title">My profile</h1>
        <p class="profile-subtitle">Your account details used across One Government services.</p>
    </header>

    <div class="profile-board">
        <aside class="profile-summary" aria-label="Profile summary">
            <p class="profile-summary-label">One Government citizen</p>
            <div class="profile-avatar">
                <div class="profile-avatar-fallback" id="profileAvatarFallback" aria-hidden="true">RP</div>
                <img id="profilePhotoPreview" alt="" hidden />
            </div>
            <h2 class="profile-name" id="profileName">Ramjibhai Pandey</h2>
            <p class="profile-email" id="profileEmail">ram@gmail.com</p>
            <p class="profile-summary-note">A single place to review your citizen account details.</p>
        </aside>

        <main class="profile-details">
            <div class="profile-details-heading">
                <div>
                    <h2 class="profile-details-title">Personal information</h2>
                    <p class="profile-details-note">Your current profile details</p>
                </div>
                <a class="profile-edit-link" href="Setting.aspx">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 20h9" /><path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L8 18l-4 1 1-4Z" /></svg>
                    Edit in Settings
                </a>
            </div>

            <div class="profile-details-grid">
                <div class="profile-detail"><p class="profile-detail-label">Full name</p><p class="profile-detail-value" id="detailName">Ramjibhai Pandey</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Email address</p><p class="profile-detail-value" id="detailEmail">ram@gmail.com</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Mobile number</p><p class="profile-detail-value" id="detailMobile">9876543210</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Date of birth</p><p class="profile-detail-value" id="detailDob">15 April 1969</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Age</p><p class="profile-detail-value" id="detailAge">57</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Gender</p><p class="profile-detail-value" id="detailGender">Male</p></div>
                <div class="profile-detail"><p class="profile-detail-label">Service category</p><p class="profile-detail-value" id="detailCategory">RTO</p></div>
            </div>

            <div class="profile-details-footer">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="9" /><path d="M12 11v5M12 8h.01" /></svg>
                To change any details, use Edit in Settings.
            </div>
        </main>
    </div>
</div>

<script type="text/javascript">
    (function () {
        setDefaultAvatar(document.getElementById('profileName').textContent);
        try {
            var profile = JSON.parse(localStorage.getItem('oneGovernmentProfile') || 'null');
            if (!profile) return;

            setProfileText('profileName', profile.name || 'Ramjibhai Pandey');
            setProfileText('profileEmail', profile.email || 'ram@gmail.com');
            setProfileText('detailName', profile.name || 'Ramjibhai Pandey');
            setProfileText('detailEmail', profile.email || 'ram@gmail.com');
            setProfileText('detailMobile', profile.mobile || '9876543210');
            setProfileText('detailAge', profile.age || '57');
            setProfileText('detailGender', formatGender(profile.gender) || 'Male');
            setProfileText('detailCategory', profile.category || 'RTO');
            if (profile.photo) {
                var image = document.getElementById('profilePhotoPreview');
                image.src = profile.photo;
                image.hidden = false;
                document.getElementById('profileAvatarFallback').hidden = true;
            }
            else setDefaultAvatar(profile.name || 'Ramjibhai Pandey');

            if (profile.dob) {
                var parts = profile.dob.split('-');
                if (parts.length === 3) {
                    var date = new Date(Number(parts[0]), Number(parts[1]) - 1, Number(parts[2]));
                    setProfileText('detailDob', date.toLocaleDateString('en-IN', { day: 'numeric', month: 'long', year: 'numeric' }));
                }
            }
        } catch (error) {
        }
    })();

    function setProfileText(id, value) {
        var element = document.getElementById(id);
        if (element) element.textContent = value;
    }

    function formatGender(value) {
        if (!value) return '';
        if (value === 'prefer-not') return 'Prefer not to say';
        return value.charAt(0).toUpperCase() + value.slice(1);
    }

    function setDefaultAvatar(name) {
        var fallback = document.getElementById('profileAvatarFallback');
        if (!fallback) return;

        name = (name || 'Guest User').trim() || 'Guest User';
        var words = name.split(/\s+/).filter(Boolean);
        var initials = words.length > 1
            ? words[0].charAt(0) + words[words.length - 1].charAt(0)
            : words[0].substring(0, 2);
        var palette = [
            ['#dbeafe', '#1e40af'],
            ['#dcfce7', '#166534'],
            ['#fef3c7', '#92400e'],
            ['#fce7f3', '#9d174d'],
            ['#e0e7ff', '#3730a3']
        ];
        var colorIndex = 0;
        for (var index = 0; index < name.length; index++) {
            colorIndex = (colorIndex + name.charCodeAt(index)) % palette.length;
        }

        fallback.textContent = initials.toUpperCase();
        fallback.style.backgroundColor = palette[colorIndex][0];
        fallback.style.color = palette[colorIndex][1];
    }

</script>
</asp:Content>
