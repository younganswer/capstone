import Image from 'next/image';
import style from '../_style/(route)/index.module.css';
import { ChatIcon } from '../_icon';

const Footer = () => {
	return (
		<div className={style.footer}>
			<div>
				<div>
					<ChatIcon width={'80cqw'} height={'80cqh'} />
				</div>
			</div>
		</div>
	);
};

export default function Home() {
	return (
		<div className={style.container}>
			<div></div>
			<div>
				<Image src="/you-know-what.png" alt="You know what" width={1025} height={488} priority />
			</div>
			<Footer />
		</div>
	);
}