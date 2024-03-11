'use client';

import ProfileImage from '../../../_component/profile-image';
import style from '../../../_style/(route)/auth/register/index.module.css';
import NicknameField from './nickname-field';
import { useSearchParams } from 'next/navigation';
import { useState } from 'react';
import RegisterButton from './button';

const RegisterPage = () => {
	const searchParams = useSearchParams();
	const [profileImageSrc, setProfileImageSrc] = useState<string | undefined>(undefined);
	const [nickname, setNickname] = useState<string>(searchParams.get('nickname') || '');

	return (
		<div className={style.container}>
			<div>
				<div>
					<span>프로필 이미지</span>
					<ProfileImage width="90cqw" height="90cqw" />
				</div>
				<NicknameField value={nickname} onChange={event => setNickname(event.target.value)} />
				<RegisterButton profileImageSrc={profileImageSrc} nickname={nickname} />
			</div>
		</div>
	);
};

export default RegisterPage;
